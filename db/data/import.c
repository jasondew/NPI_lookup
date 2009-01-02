#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <my_global.h>
#include <my_sys.h>
#include <mysql.h>

#define BUFFER_SIZE 16384
#define FIELD_SIZE 500
#define FIELD_COUNT 314

static char *opt_host_name = "localhost";
static char *opt_user_name = "root";
static char *opt_password = "doc1291";
static char *opt_db_name = "npi_lookup_development";

static MYSQL *conn;
static MYSQL_STMT *provider_stmt, *address_stmt, *authorized_official_stmt,
                  *license_stmt, *taxonomy_stmt, *identifier_stmt;

void initiate_database_connection(char*);
void close_database_connection();
void execute_query(MYSQL*, char*);

int  add_provider(char**);
void add_address(char**, int, int, int);
void add_authorized_official(char**, int);
void add_licenses(char**, int);
void add_taxonomies(char**, int);
void add_identifiers(char**, int);

MYSQL_STMT* prepared_statement(char*);
void execute_prepared_statement(MYSQL_STMT*, MYSQL_BIND*);
void bind_number(MYSQL_BIND*, int*);
void bind_string(MYSQL_BIND*, char*);
void bind_date(MYSQL_BIND*, MYSQL_TIME*, char*);
bool is_blank(char*);
void error(char*);

int main(int argc, char *argv[]) {
  // FIXME: read from STDIN instead
  if (!argv[1]) {
    printf("Usage: %s input.csv\n", argv[0]);
    exit(0);
  }

  char *original_buffer, *buffer = malloc(BUFFER_SIZE * sizeof(char));
  char** records = (char **) malloc(FIELD_COUNT * sizeof(char*));

  char* field = malloc(FIELD_SIZE * sizeof(char));
  char* position;

  unsigned int line_number = 0, i = 0, provider_id;
  FILE* input_file;

  for (i = 0; i < FIELD_COUNT; i++) {
    records[i] = (char *) malloc(FIELD_SIZE * sizeof(char));
  }

  initiate_database_connection(argv[0]);

  // define SQL statements for inserting data
  provider_stmt = prepared_statement("INSERT INTO providers (npi, entity_type_code, replacement_npi, ein, organization_name, "
                                     "last_name, first_name, middle_name, name_prefix, name_suffix, credentials, "
                                     "other_organization_name, other_organization_name_type, other_last_name, other_first_name, "
                                     "other_middle_name, other_name_prefix, other_name_suffix, other_credentials, "
                                     "other_last_name_type, enumeration_date, update_date, deactivation_reason, deactivation_date, "
                                     "reactivation_date, gender, sole_proprietor, organization_subpart, parent_organization_lbn, "
                                     "parent_organization_tin)"
                                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

  address_stmt = prepared_statement("INSERT INTO addresses (addressable_id, addressable_type, address_type, street_1,"
                                    "street_2, city, state, postal_code, country_code, phone_number, fax_number) "
                                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

  authorized_official_stmt = prepared_statement("INSERT INTO authorized_officials (provider_id, last_name, "
                                                "first_name, middle_name, title, phone_number, prefix, "
                                                "suffix, credentials) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

  license_stmt = prepared_statement("INSERT INTO provider_licenses (provider_id, number, state_code) VALUES (?, ?, ?)");
  taxonomy_stmt = prepared_statement("INSERT INTO provider_taxonomies (provider_id, number, switch) VALUES (?, ?, ?)");
  identifier_stmt = prepared_statement("INSERT INTO provider_identifiers (provider_id, number, identifier_type, state_code, issuer) "
                                       "VALUES(?, ?, ?, ?, ?)");

  // empty all of the tables before inserting new data
  execute_query(conn, "TRUNCATE TABLE providers");
  execute_query(conn, "TRUNCATE TABLE provider_licenses");
  execute_query(conn, "TRUNCATE TABLE provider_identifiers");
  execute_query(conn, "TRUNCATE TABLE provider_taxonomies");
  execute_query(conn, "TRUNCATE TABLE addresses");
  execute_query(conn, "TRUNCATE TABLE authorized_officials");

  // open up the file and handle any error
  input_file = fopen(argv[1], "r");

  if (!input_file) {
    printf("Error opening %s\n", argv[1]);
    exit(1);
  }

  // loop through each line of the input
  while (fgets(original_buffer, BUFFER_SIZE, input_file)) {
    // ignore the first line (headers)
    if (++line_number > 1) {

      // all fields are enclosed by quotes, so strip off the initial quote
      i = 0;
      buffer = original_buffer + 1;

      // find the next occurrence of "," and copy out
      // from the beginning of the string to there
      // and then increment buffer
      while (position = strstr(buffer, "\",\"")) {
        records[i][0] = '\0';
        strncpy(records[i], buffer, position - buffer);
        i++;
        buffer = position + 3;
      }

      // add the provider and then populate all related
      // tables with the provider_id
      provider_id = add_provider(records);
      add_address(records, provider_id, 1, 17);
      add_address(records, provider_id, 2, 25);
      add_authorized_official(records, provider_id);
      add_licenses(records, provider_id);
      add_taxonomies(records, provider_id);
      add_identifiers(records, provider_id);
    }
  }

  // close out the file, close the db connection
  // and free all pointers
  fclose(input_file);

  for (i = 0; i < FIELD_COUNT; i++) {
    free(records[i]);
  }

  free(records);
  free(original_buffer);

  close_database_connection();

  return 0;
}

// initiate a connection to the database
// and handle any errors
void initiate_database_connection(char *program_name) {
  MY_INIT(program_name);

  if (mysql_library_init(0, NULL, NULL)) { error("mysql_library_init() failed"); }
  conn = mysql_init(NULL);

  if (conn == NULL) { error("mysql_init() failed (probably out of memory)"); }
  if (mysql_real_connect(conn, opt_host_name, opt_user_name, opt_password, opt_db_name, 0, NULL, 0) == NULL)
    error("mysql_real_connect() failed");
}

// close the database connection
void close_database_connection() {
  mysql_close(conn);
  mysql_library_end();
}

// execute a SQL query and handle any errors
void execute_query(MYSQL* conn, char sql[]) {
  if (mysql_query(conn, sql) != 0) { 
    printf("ERROR: SQL was %s\n", sql);
    exit(1);
  } 
}

// add a provider using input data
int add_provider(char** records) {
  int i, npi, entity_type_code, replacement_npi;
  MYSQL_BIND bindings[30];
  MYSQL_TIME enumeration_date, update_date, deactivation_date, reactivation_date;

  memset(bindings, 0, sizeof(bindings));

  npi = atoi(records[0]);
  entity_type_code = atoi(records[1]);
  replacement_npi = atoi(records[2]);

  bind_number(&bindings[0], &npi);
  bind_number(&bindings[1], &entity_type_code);
  bind_number(&bindings[2], &replacement_npi);

  for (i=3; i<20; i++) { bind_string(&bindings[i], records[i]); }

  bind_date(&bindings[21], &enumeration_date, records[37]);
  bind_date(&bindings[22], &update_date, records[38]);
  bind_string(&bindings[23], records[39]);
  bind_date(&bindings[24], &deactivation_date, records[40]);
  bind_date(&bindings[25], &reactivation_date, records[41]);
  bind_string(&bindings[26], records[42]);

  for (i=26; i<30; i++) { bind_string(&bindings[i], records[i+281]); }

  execute_prepared_statement(provider_stmt, bindings);

  return mysql_insert_id(conn);
}

// add an address given input, provider_id, type, and offset
// this is so mailing and physical addresses can be read in
void add_address(char** records, int provider_id, int address_type, int offset) {
  int i;
  MYSQL_BIND bindings[11];

  memset(bindings, 0, sizeof(bindings));

  bindings[0].buffer = &provider_id;  bindings[0].buffer_type = MYSQL_TYPE_LONG;
  bindings[1].buffer = "Provider";
  bindings[2].buffer = &address_type; bindings[2].buffer_type = MYSQL_TYPE_LONG;

  for (i=3; i<11; i++) { bind_string(&bindings[i], records[i+offset]); }

  execute_prepared_statement(address_stmt, bindings);
}

// add an authorized official related to a provider
void add_authorized_official(char** records, int provider_id) {
  int i;
  MYSQL_BIND bindings[9];
  bool all_blank = TRUE;

  memset(bindings, 0, sizeof(bindings));

  bindings[0].buffer = &provider_id;  bindings[0].buffer_type = MYSQL_TYPE_LONG;
  for (i=1; i<6; i++) { bind_string(&bindings[i], records[i+41]); }
  for (i=6; i<9; i++) { bind_string(&bindings[i], records[i+305]); }

  for (i=1; i<9; i++) {
    if (strlen(bindings[i].buffer) > 0) { all_blank = FALSE; }
  }

  if (!all_blank) { execute_prepared_statement(authorized_official_stmt, bindings); }
}

// add all licenses based on input records
void add_licenses(char** records, int provider_id) {
  int i, j;
  bool all_blank;
  char *field;
  MYSQL_BIND bindings[3];

  for (i=0; i<60; i+=4) {
    memset(bindings, 0, sizeof(bindings));
    all_blank = TRUE;

    bindings[0].buffer = &provider_id;  bindings[0].buffer_type = MYSQL_TYPE_LONG;
    for (j=1; j<3; j++) {
      field = records[i+j+47];
      bind_string(&bindings[j], field);
      if (!is_blank(field)) { all_blank = FALSE; }
    }

    if (!all_blank) { execute_prepared_statement(license_stmt, bindings); }
  }
}

// add all taxonomies based on input records
void add_taxonomies(char** records, int provider_id) {
  int i;
  MYSQL_BIND bindings[3];

  for (i=0; i<60; i+=4) {
    memset(bindings, 0, sizeof(bindings));

    bindings[0].buffer = &provider_id;  bindings[0].buffer_type = MYSQL_TYPE_LONG;
    bind_string(&bindings[1], records[i+47]);
    bind_string(&bindings[2], records[i+50]);

    if (!(is_blank(bindings[1].buffer) && is_blank(bindings[2].buffer)))
      execute_prepared_statement(taxonomy_stmt, bindings);
  }
}

// add all identifiers based on input records
void add_identifiers(char** records, int provider_id) {
  int i, j;
  bool all_blank;
  char *field;
  MYSQL_BIND bindings[5];

  for (i=0; i<200; i+=4) {
    memset(bindings, 0, sizeof(bindings));
    all_blank = TRUE;

    bindings[0].buffer = &provider_id;  bindings[0].buffer_type = MYSQL_TYPE_LONG;
    for (j=1; j<5; j++) {
      field = records[i+j+106];
      bind_string(&bindings[j], field);
      if (!is_blank(field)) { all_blank = FALSE; }
    }

    if (!all_blank) { execute_prepared_statement(identifier_stmt, bindings); }
  }
}

// create a new prepared statement based on SQL
MYSQL_STMT* prepared_statement(char* sql) {
  MYSQL_STMT *ps = mysql_stmt_init(conn);
  mysql_stmt_prepare(ps, sql, strlen(sql));

  return ps;
}

// execute a prepared statement given some bindings
void execute_prepared_statement(MYSQL_STMT *ps, MYSQL_BIND *bindings) {
  mysql_stmt_bind_param(ps, bindings);
  mysql_stmt_execute(ps);
}

// bind an integer
void bind_number(MYSQL_BIND* binding, int* number) {
  binding->buffer = number;
  binding->buffer_type = MYSQL_TYPE_LONG;
}

// bind a string
void bind_string(MYSQL_BIND* binding, char* string) {
  binding->buffer = string;
  binding->buffer_type = MYSQL_TYPE_STRING;
  binding->buffer_length = strlen(string);
}

// bind a date
void bind_date(MYSQL_BIND* binding, MYSQL_TIME* date, char* string) {
  date->year  = atoi(string + 6); string[5] = '\0';
  date->month = atoi(string + 3); string[2] = '\0';
  date->day   = atoi(string);

  if (!is_blank(string)) {
    binding->buffer = date;
    binding->buffer_type = MYSQL_TYPE_DATE;
  }
}

// is a string blank?
bool is_blank(char *string) {
  return strlen(string) == 0;
}

// display an error message and exit
void error(char message[]) {
  printf("%s\n", message);
  exit(1);
}
