class CreateRestaurantTables < ActiveRecord::Migration
  def change
    create_table :restaurant_tables do |t|
      t.integer :capacity
    end
  end
end
