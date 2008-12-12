class CreateProviders < ActiveRecord::Migration
  def self.up
    create_table :providers do |t|
      t.string :npi, :length => 10

      t.string :first_name, :last_name, :prefix, :suffix, :credentials
    end
  end

  def self.down
    drop_table :providers
  end
end
