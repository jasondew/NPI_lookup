# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081228153641) do

  create_table "addresses", :force => true do |t|
    t.integer "addressable_id"
    t.string  "addressable_type"
    t.string  "address_type"
    t.string  "street_1",         :limit => 55
    t.string  "street_2",         :limit => 55
    t.string  "city",             :limit => 40
    t.string  "state",            :limit => 40
    t.string  "postal_code",      :limit => 20
    t.string  "country_code",     :limit => 2
    t.string  "phone_number",     :limit => 20
    t.string  "fax_number",       :limit => 20
  end

  create_table "authorized_officials", :force => true do |t|
    t.integer "provider_id"
    t.string  "last_name",    :limit => 35
    t.string  "first_name",   :limit => 20
    t.string  "middle_name",  :limit => 20
    t.string  "prefix",       :limit => 5
    t.string  "suffix",       :limit => 5
    t.string  "credentials",  :limit => 20
    t.string  "title",        :limit => 35
    t.string  "phone_number", :limit => 20
  end

  create_table "npi", :force => true do |t|
    t.string "npi",                             :limit => 10
    t.string "entity_type_code",                :limit => 1
    t.string "replacement_npi",                 :limit => 10
    t.string "ein",                             :limit => 9
    t.string "organization_name",               :limit => 70
    t.string "last_name",                       :limit => 35
    t.string "first_name",                      :limit => 20
    t.string "middle_name",                     :limit => 20
    t.string "name_prefix",                     :limit => 5
    t.string "name_suffix",                     :limit => 5
    t.string "credentials",                     :limit => 20
    t.string "other_organization_name",         :limit => 70
    t.string "other_organization_name_type",    :limit => 1
    t.string "other_last_name_type",            :limit => 1
    t.string "mailing_street_1",                :limit => 55
    t.string "mailing_street_2",                :limit => 55
    t.string "mailing_city",                    :limit => 40
    t.string "mailing_state",                   :limit => 40
    t.string "mailing_postal_code",             :limit => 20
    t.string "mailing_country_code",            :limit => 2
    t.string "mailing_phone_number",            :limit => 20
    t.string "mailing_fax_number",              :limit => 20
    t.string "practice_street_1",               :limit => 55
    t.string "practice_street_2",               :limit => 55
    t.string "practice_city",                   :limit => 40
    t.string "practice_state",                  :limit => 40
    t.string "practice_postal_code",            :limit => 20
    t.string "practice_country_code",           :limit => 2
    t.string "practice_phone_number",           :limit => 20
    t.string "practice_fax_number",             :limit => 20
    t.string "enumeration_date",                :limit => 10
    t.string "update_date",                     :limit => 10
    t.string "deactivation_reason",             :limit => 2
    t.string "deactivation_date",               :limit => 10
    t.string "reactivation_date",               :limit => 10
    t.string "gender",                          :limit => 1
    t.string "authorized_official_last_name",   :limit => 35
    t.string "authorized_official_first_name",  :limit => 20
    t.string "authorized_official_middle_name", :limit => 20
    t.string "authorized_official_title",       :limit => 35
    t.string "authorized_phone_number",         :limit => 20
    t.string "taxonomy_1",                      :limit => 10
    t.string "license_number_1",                :limit => 20
    t.string "license_number_state_1",          :limit => 2
    t.string "primary_taxonomy_switch_1",       :limit => 1
    t.string "taxonomy_2",                      :limit => 10
    t.string "license_number_2",                :limit => 20
    t.string "license_number_state_2",          :limit => 2
    t.string "primary_taxonomy_switch_2",       :limit => 1
    t.string "taxonomy_3",                      :limit => 10
    t.string "license_number_3",                :limit => 20
    t.string "license_number_state_3",          :limit => 2
    t.string "primary_taxonomy_switch_3",       :limit => 1
    t.string "taxonomy_4",                      :limit => 10
    t.string "license_number_4",                :limit => 20
    t.string "license_number_state_4",          :limit => 2
    t.string "primary_taxonomy_switch_4",       :limit => 1
    t.string "taxonomy_5",                      :limit => 10
    t.string "license_number_5",                :limit => 20
    t.string "license_number_state_5",          :limit => 2
    t.string "primary_taxonomy_switch_5",       :limit => 1
    t.string "taxonomy_6",                      :limit => 10
    t.string "license_number_6",                :limit => 20
    t.string "license_number_state_6",          :limit => 2
    t.string "primary_taxonomy_switch_6",       :limit => 1
    t.string "taxonomy_7",                      :limit => 10
    t.string "license_number_7",                :limit => 20
    t.string "license_number_state_7",          :limit => 2
    t.string "primary_taxonomy_switch_7",       :limit => 1
    t.string "taxonomy_8",                      :limit => 10
    t.string "license_number_8",                :limit => 20
    t.string "license_number_state_8",          :limit => 2
    t.string "primary_taxonomy_switch_8",       :limit => 1
    t.string "taxonomy_9",                      :limit => 10
    t.string "license_number_9",                :limit => 20
    t.string "license_number_state_9",          :limit => 2
    t.string "primary_taxonomy_switch_9",       :limit => 1
    t.string "taxonomy_10",                     :limit => 10
    t.string "license_number_10",               :limit => 20
    t.string "license_number_state_10",         :limit => 2
    t.string "primary_taxonomy_switch_10",      :limit => 1
    t.string "taxonomy_11",                     :limit => 10
    t.string "license_number_11",               :limit => 20
    t.string "license_number_state_11",         :limit => 2
    t.string "primary_taxonomy_switch_11",      :limit => 1
    t.string "taxonomy_12",                     :limit => 10
    t.string "license_number_12",               :limit => 20
    t.string "license_number_state_12",         :limit => 2
    t.string "primary_taxonomy_switch_12",      :limit => 1
    t.string "taxonomy_13",                     :limit => 10
    t.string "license_number_13",               :limit => 20
    t.string "license_number_state_13",         :limit => 2
    t.string "primary_taxonomy_switch_13",      :limit => 1
    t.string "taxonomy_14",                     :limit => 10
    t.string "license_number_14",               :limit => 20
    t.string "license_number_state_14",         :limit => 2
    t.string "primary_taxonomy_switch_14",      :limit => 1
    t.string "taxonomy_15",                     :limit => 10
    t.string "license_number_15",               :limit => 20
    t.string "license_number_state_15",         :limit => 2
    t.string "primary_taxonomy_switch_15",      :limit => 1
    t.string "identifier_1",                    :limit => 20
    t.string "identifier_type_1",               :limit => 2
    t.string "identifier_state_1",              :limit => 2
    t.string "identifier_issuer_1",             :limit => 2
    t.string "identifier_2",                    :limit => 20
    t.string "identifier_type_2",               :limit => 2
    t.string "identifier_state_2",              :limit => 2
    t.string "identifier_issuer_2",             :limit => 2
    t.string "identifier_3",                    :limit => 20
    t.string "identifier_type_3",               :limit => 2
    t.string "identifier_state_3",              :limit => 2
    t.string "identifier_issuer_3",             :limit => 2
    t.string "identifier_4",                    :limit => 20
    t.string "identifier_type_4",               :limit => 2
    t.string "identifier_state_4",              :limit => 2
    t.string "identifier_issuer_4",             :limit => 2
    t.string "identifier_5",                    :limit => 20
    t.string "identifier_type_5",               :limit => 2
    t.string "identifier_state_5",              :limit => 2
    t.string "identifier_issuer_5",             :limit => 2
    t.string "identifier_6",                    :limit => 20
    t.string "identifier_type_6",               :limit => 2
    t.string "identifier_state_6",              :limit => 2
    t.string "identifier_issuer_6",             :limit => 2
    t.string "identifier_7",                    :limit => 20
    t.string "identifier_type_7",               :limit => 2
    t.string "identifier_state_7",              :limit => 2
    t.string "identifier_issuer_7",             :limit => 2
    t.string "identifier_8",                    :limit => 20
    t.string "identifier_type_8",               :limit => 2
    t.string "identifier_state_8",              :limit => 2
    t.string "identifier_issuer_8",             :limit => 2
    t.string "identifier_9",                    :limit => 20
    t.string "identifier_type_9",               :limit => 2
    t.string "identifier_state_9",              :limit => 2
    t.string "identifier_issuer_9",             :limit => 2
    t.string "identifier_10",                   :limit => 20
    t.string "identifier_type_10",              :limit => 2
    t.string "identifier_state_10",             :limit => 2
    t.string "identifier_issuer_10",            :limit => 2
    t.string "identifier_11",                   :limit => 20
    t.string "identifier_type_11",              :limit => 2
    t.string "identifier_state_11",             :limit => 2
    t.string "identifier_issuer_11",            :limit => 2
    t.string "identifier_12",                   :limit => 20
    t.string "identifier_type_12",              :limit => 2
    t.string "identifier_state_12",             :limit => 2
    t.string "identifier_issuer_12",            :limit => 2
    t.string "identifier_13",                   :limit => 20
    t.string "identifier_type_13",              :limit => 2
    t.string "identifier_state_13",             :limit => 2
    t.string "identifier_issuer_13",            :limit => 2
    t.string "identifier_14",                   :limit => 20
    t.string "identifier_type_14",              :limit => 2
    t.string "identifier_state_14",             :limit => 2
    t.string "identifier_issuer_14",            :limit => 2
    t.string "identifier_15",                   :limit => 20
    t.string "identifier_type_15",              :limit => 2
    t.string "identifier_state_15",             :limit => 2
    t.string "identifier_issuer_15",            :limit => 2
    t.string "identifier_16",                   :limit => 20
    t.string "identifier_type_16",              :limit => 2
    t.string "identifier_state_16",             :limit => 2
    t.string "identifier_issuer_16",            :limit => 2
    t.string "identifier_17",                   :limit => 20
    t.string "identifier_type_17",              :limit => 2
    t.string "identifier_state_17",             :limit => 2
    t.string "identifier_issuer_17",            :limit => 2
    t.string "identifier_18",                   :limit => 20
    t.string "identifier_type_18",              :limit => 2
    t.string "identifier_state_18",             :limit => 2
    t.string "identifier_issuer_18",            :limit => 2
    t.string "identifier_19",                   :limit => 20
    t.string "identifier_type_19",              :limit => 2
    t.string "identifier_state_19",             :limit => 2
    t.string "identifier_issuer_19",            :limit => 2
    t.string "identifier_20",                   :limit => 20
    t.string "identifier_type_20",              :limit => 2
    t.string "identifier_state_20",             :limit => 2
    t.string "identifier_issuer_20",            :limit => 2
    t.string "identifier_21",                   :limit => 20
    t.string "identifier_type_21",              :limit => 2
    t.string "identifier_state_21",             :limit => 2
    t.string "identifier_issuer_21",            :limit => 2
    t.string "identifier_22",                   :limit => 20
    t.string "identifier_type_22",              :limit => 2
    t.string "identifier_state_22",             :limit => 2
    t.string "identifier_issuer_22",            :limit => 2
    t.string "identifier_23",                   :limit => 20
    t.string "identifier_type_23",              :limit => 2
    t.string "identifier_state_23",             :limit => 2
    t.string "identifier_issuer_23",            :limit => 2
    t.string "identifier_24",                   :limit => 20
    t.string "identifier_type_24",              :limit => 2
    t.string "identifier_state_24",             :limit => 2
    t.string "identifier_issuer_24",            :limit => 2
    t.string "identifier_25",                   :limit => 20
    t.string "identifier_type_25",              :limit => 2
    t.string "identifier_state_25",             :limit => 2
    t.string "identifier_issuer_25",            :limit => 2
    t.string "identifier_26",                   :limit => 20
    t.string "identifier_type_26",              :limit => 2
    t.string "identifier_state_26",             :limit => 2
    t.string "identifier_issuer_26",            :limit => 2
    t.string "identifier_27",                   :limit => 20
    t.string "identifier_type_27",              :limit => 2
    t.string "identifier_state_27",             :limit => 2
    t.string "identifier_issuer_27",            :limit => 2
    t.string "identifier_28",                   :limit => 20
    t.string "identifier_type_28",              :limit => 2
    t.string "identifier_state_28",             :limit => 2
    t.string "identifier_issuer_28",            :limit => 2
    t.string "identifier_29",                   :limit => 20
    t.string "identifier_type_29",              :limit => 2
    t.string "identifier_state_29",             :limit => 2
    t.string "identifier_issuer_29",            :limit => 2
    t.string "identifier_30",                   :limit => 20
    t.string "identifier_type_30",              :limit => 2
    t.string "identifier_state_30",             :limit => 2
    t.string "identifier_issuer_30",            :limit => 2
    t.string "identifier_31",                   :limit => 20
    t.string "identifier_type_31",              :limit => 2
    t.string "identifier_state_31",             :limit => 2
    t.string "identifier_issuer_31",            :limit => 2
    t.string "identifier_32",                   :limit => 20
    t.string "identifier_type_32",              :limit => 2
    t.string "identifier_state_32",             :limit => 2
    t.string "identifier_issuer_32",            :limit => 2
    t.string "identifier_33",                   :limit => 20
    t.string "identifier_type_33",              :limit => 2
    t.string "identifier_state_33",             :limit => 2
    t.string "identifier_issuer_33",            :limit => 2
    t.string "identifier_34",                   :limit => 20
    t.string "identifier_type_34",              :limit => 2
    t.string "identifier_state_34",             :limit => 2
    t.string "identifier_issuer_34",            :limit => 2
    t.string "identifier_35",                   :limit => 20
    t.string "identifier_type_35",              :limit => 2
    t.string "identifier_state_35",             :limit => 2
    t.string "identifier_issuer_35",            :limit => 2
    t.string "identifier_36",                   :limit => 20
    t.string "identifier_type_36",              :limit => 2
    t.string "identifier_state_36",             :limit => 2
    t.string "identifier_issuer_36",            :limit => 2
    t.string "identifier_37",                   :limit => 20
    t.string "identifier_type_37",              :limit => 2
    t.string "identifier_state_37",             :limit => 2
    t.string "identifier_issuer_37",            :limit => 2
    t.string "identifier_38",                   :limit => 20
    t.string "identifier_type_38",              :limit => 2
    t.string "identifier_state_38",             :limit => 2
    t.string "identifier_issuer_38",            :limit => 2
    t.string "identifier_39",                   :limit => 20
    t.string "identifier_type_39",              :limit => 2
    t.string "identifier_state_39",             :limit => 2
    t.string "identifier_issuer_39",            :limit => 2
    t.string "identifier_40",                   :limit => 20
    t.string "identifier_type_40",              :limit => 2
    t.string "identifier_state_40",             :limit => 2
    t.string "identifier_issuer_40",            :limit => 2
    t.string "identifier_41",                   :limit => 20
    t.string "identifier_type_41",              :limit => 2
    t.string "identifier_state_41",             :limit => 2
    t.string "identifier_issuer_41",            :limit => 2
    t.string "identifier_42",                   :limit => 20
    t.string "identifier_type_42",              :limit => 2
    t.string "identifier_state_42",             :limit => 2
    t.string "identifier_issuer_42",            :limit => 2
    t.string "identifier_43",                   :limit => 20
    t.string "identifier_type_43",              :limit => 2
    t.string "identifier_state_43",             :limit => 2
    t.string "identifier_issuer_43",            :limit => 2
    t.string "identifier_44",                   :limit => 20
    t.string "identifier_type_44",              :limit => 2
    t.string "identifier_state_44",             :limit => 2
    t.string "identifier_issuer_44",            :limit => 2
    t.string "identifier_45",                   :limit => 20
    t.string "identifier_type_45",              :limit => 2
    t.string "identifier_state_45",             :limit => 2
    t.string "identifier_issuer_45",            :limit => 2
    t.string "identifier_46",                   :limit => 20
    t.string "identifier_type_46",              :limit => 2
    t.string "identifier_state_46",             :limit => 2
    t.string "identifier_issuer_46",            :limit => 2
    t.string "identifier_47",                   :limit => 20
    t.string "identifier_type_47",              :limit => 2
    t.string "identifier_state_47",             :limit => 2
    t.string "identifier_issuer_47",            :limit => 2
    t.string "identifier_48",                   :limit => 20
    t.string "identifier_type_48",              :limit => 2
    t.string "identifier_state_48",             :limit => 2
    t.string "identifier_issuer_48",            :limit => 2
    t.string "identifier_49",                   :limit => 20
    t.string "identifier_type_49",              :limit => 2
    t.string "identifier_state_49",             :limit => 2
    t.string "identifier_issuer_49",            :limit => 2
    t.string "identifier_50",                   :limit => 20
    t.string "identifier_type_50",              :limit => 2
    t.string "identifier_state_50",             :limit => 2
    t.string "identifier_issuer_50",            :limit => 2
    t.string "sole_proprietor",                 :limit => 1
    t.string "organization_subpart",            :limit => 1
    t.string "parent_organization_lbn",         :limit => 70
    t.string "parent_organization_tin",         :limit => 9
    t.string "authorized_official_prefix",      :limit => 5
    t.string "authorized_official_suffix",      :limit => 5
    t.string "authorized_official_credentials", :limit => 20
  end

  create_table "provider_identifiers", :force => true do |t|
    t.integer "provider_id"
    t.string  "number",          :limit => 20
    t.string  "identifier_type", :limit => 2
    t.string  "state_code",      :limit => 2
    t.string  "issuer",          :limit => 2
  end

  create_table "provider_licenses", :force => true do |t|
    t.integer "provider_id"
    t.string  "number",      :limit => 20
    t.string  "state_code",  :limit => 2
  end

  create_table "provider_searches", :force => true do |t|
    t.string   "npi"
    t.string   "organization_name"
    t.string   "last_name"
    t.string   "taxonomy"
    t.string   "postal_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provider_taxonomies", :force => true do |t|
    t.integer "provider_id"
    t.string  "number",      :limit => 10
    t.string  "switch",      :limit => 1
  end

  create_table "providers", :force => true do |t|
    t.string "npi",                          :limit => 10
    t.string "entity_type_code",             :limit => 1
    t.string "replacement_npi",              :limit => 10
    t.string "ein",                          :limit => 9
    t.string "organization_name",            :limit => 70
    t.string "last_name",                    :limit => 35
    t.string "first_name",                   :limit => 20
    t.string "middle_name",                  :limit => 20
    t.string "name_prefix",                  :limit => 5
    t.string "name_suffix",                  :limit => 5
    t.string "credentials",                  :limit => 20
    t.string "other_organization_name",      :limit => 70
    t.string "other_organization_name_type", :limit => 1
    t.string "other_last_name",              :limit => 35
    t.string "other_first_name",             :limit => 20
    t.string "other_middle_name",            :limit => 20
    t.string "other_name_prefix",            :limit => 5
    t.string "other_name_suffix",            :limit => 5
    t.string "other_credentials",            :limit => 20
    t.string "other_last_name_type",         :limit => 1
    t.string "enumeration_date",             :limit => 10
    t.string "update_date",                  :limit => 10
    t.string "deactivation_reason",          :limit => 2
    t.string "deactivation_date",            :limit => 10
    t.string "reactivation_date",            :limit => 10
    t.string "gender",                       :limit => 1
    t.string "sole_proprietor",              :limit => 1
    t.string "organization_subpart",         :limit => 1
    t.string "parent_organization_lbn",      :limit => 70
    t.string "parent_organization_tin",      :limit => 9
  end

end
