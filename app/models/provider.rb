class Provider < ActiveRecord::Base
  
  is_indexed :fields => %w{
    npi organization_name last_name mailing_postal_code practice_postal_code
    taxonomy_1 taxonomy_2 taxonomy_3 taxonomy_4 taxonomy_5 taxonomy_6 taxonomy_7
    taxonomy_8 taxonomy_9 taxonomy_10 taxonomy_11 taxonomy_12 taxonomy_13
    taxonomy_14 taxonomy_15
  }

end
