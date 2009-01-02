class NormalizeProviders < ActiveRecord::Migration
  def self.up
    rename_table :providers, :npi

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
      t.string :other_last_name, :limit => 35
      t.string :other_first_name, :limit => 20
      t.string :other_middle_name, :limit => 20
      t.string :other_name_prefix, :limit => 5
      t.string :other_name_suffix, :limit => 5
      t.string :other_credentials, :limit => 20
      t.string :other_last_name_type, :limit => 1

      t.string :enumeration_date, :update_date, :limit => 10
      t.string :deactivation_reason, :limit => 2
      t.string :deactivation_date, :reactivation_date, :limit => 10

      t.string :gender, :limit => 1

      t.string :sole_proprietor, :organization_subpart, :limit => 1
      t.string :parent_organization_lbn, :limit => 70
      t.string :parent_organization_tin, :limit => 9
    end

    create_table :addresses do |t|
      t.references :addressable, :polymorphic => true
      t.string "address_type" # mailing, practice

      t.string "street_1", :limit => 55
      t.string "street_2", :limit => 55
      t.string "city", :limit => 40
      t.string "state", :limit => 40
      t.string "postal_code", :limit => 20
      t.string "country_code", :limit => 2
      t.string "phone_number", :limit => 20
      t.string "fax_number", :limit => 20
    end

    create_table :authorized_officials do |t|
      t.belongs_to :provider

      t.string :last_name, :limit => 35
      t.string :first_name, :limit => 20
      t.string :middle_name, :limit => 20
      t.string :prefix, :suffix, :limit => 5
      t.string :credentials, :limit => 20
      t.string :title, :limit => 35
      t.string :phone_number, :limit => 20
    end

    create_table :provider_taxonomies do |t|
      t.belongs_to :provider

      t.string "number", :limit => 10
      t.string "switch", :limit => 1
    end

    create_table :provider_licenses do |t|
      t.belongs_to :provider

      t.string "number", :limit => 20
      t.string "state_code", :limit => 2
    end

    create_table :provider_identifiers do |t|
      t.belongs_to :provider

      t.string "number", :limit => 20
      t.string "identifier_type", :limit => 2
      t.string "state_code", :limit => 2
      t.string "issuer", :limit => 2
    end
  end

  def self.down
    drop_table :provider_identifiers
    drop_table :provider_licenses
    drop_table :provider_taxonomies
    drop_table :authorized_officials
    drop_table :addresses
    drop_table :providers
    rename_table :npi, :providers
  end
end
