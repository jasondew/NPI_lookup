class CreateProviderSearches < ActiveRecord::Migration
  def self.up
    create_table :provider_searches do |t|
      t.string :npi, :organization_name, :last_name, :taxonomy, :postal_code
      t.timestamps
    end
  end

  def self.down
    drop_table :provider_searches
  end
end
