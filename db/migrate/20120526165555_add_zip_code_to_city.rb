class AddZipCodeToCity < ActiveRecord::Migration
  def self.up
    add_column :cities, :zip_code, :string
  end

  def self.down
    remove_column :cities, :zip_code
  end
end
