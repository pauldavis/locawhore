class FirstPlaceListAndPlaceStructures < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :cities do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :place_lists do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :city_id
      t.integer  :category_id
    end
    add_index :place_lists, [:city_id]
    add_index :place_lists, [:category_id]

    create_table :places do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :place_list_id
    end
    add_index :places, [:place_list_id]
  end

  def self.down
    drop_table :categories
    drop_table :cities
    drop_table :place_lists
    drop_table :places
  end
end
