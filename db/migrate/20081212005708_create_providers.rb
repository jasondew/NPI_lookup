class CreateProviders < ActiveRecord::Migration
  def self.up
    create_table :providers do |t|
      t.string :npi, :limit => 10
      t.string :entity_type_code, :limit => 1
      t.string :replacement_npi, :limit => 10
      t.string :ein, :limit => 9

      t.string :organization_name, :limit => 70
      t.string :last_name, :limit => 35
      t.string :first_name, :limit => 20
      t.string :middle_name, :limit => 20
      t.string :name_prefix, :limit => 5
      t.string :name_suffix, :limit => 5
      t.string :credentials, :limit => 20

      t.string :other_organization_name, :limit => 70
      t.string :other_organization_name_type, :limit => 1
      t.string :last_name, :limit => 35
      t.string :first_name, :limit => 20
      t.string :middle_name, :limit => 20
      t.string :name_prefix, :limit => 5
      t.string :name_suffix, :limit => 5
      t.string :credentials, :limit => 20
      t.string :other_last_name_type, :limit => 1

      %w(mailing practice).each do |prefix|
        t.string "#{prefix}_street_1", :limit => 55
        t.string "#{prefix}_street_2", :limit => 55
        t.string "#{prefix}_city", :limit => 40
        t.string "#{prefix}_state", :limit => 40
        t.string "#{prefix}_postal_code", :limit => 20
        t.string "#{prefix}_country_code", :limit => 2
        t.string "#{prefix}_phone_number", :limit => 20
        t.string "#{prefix}_fax_number", :limit => 20
      end

      t.string :enumeration_date, :update_date, :limit => 10
      t.string :deactivation_reason, :limit => 2
      t.string :deactivation_date, :reactivation_date, :limit => 10

      t.string :gender, :limit => 1

      t.string :authorized_official_last_name, :limit => 35
      t.string :authorized_official_first_name, :limit => 20
      t.string :authorized_official_middle_name, :limit => 20
      t.string :authorized_official_title, :limit => 35
      t.string :authorized_phone_number, :limit => 20

      1.upto(15) do |index|
        t.string "taxonomy_#{index}", :limit => 10
        t.string "license_number_#{index}", :limit => 20
        t.string "license_number_state_#{index}", :limit => 2
        t.string "primary_taxonomy_switch_#{index}", :limit => 1
      end

      1.upto(50) do |index|
        t.string "identifier_#{index}", :limit => 20
        t.string "identifier_type_#{index}", :limit => 2
        t.string "identifier_state_#{index}", :limit => 2
        t.string "identifier_issuer_#{index}", :limit => 2
      end

      t.string :sole_proprietor, :organization_subpart, :limit => 1
      t.string :parent_organization_lbn, :limit => 70
      t.string :parent_organization_tin, :limit => 9

      t.string :authorized_official_prefix, :authorized_official_suffix, :limit => 5
      t.string :authorized_official_credentials, :limit => 20
    end
  end

  def self.down
    drop_table :providers
  end
end
