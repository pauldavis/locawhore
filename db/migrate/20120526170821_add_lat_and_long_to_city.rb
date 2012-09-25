class AddLatAndLongToCity < ActiveRecord::Migration
  def self.up
    add_column :cities, :lat, :string
    add_column :cities, :long, :string
  end

  def self.down
    remove_column :cities, :lat
    remove_column :cities, :long
  end
end
