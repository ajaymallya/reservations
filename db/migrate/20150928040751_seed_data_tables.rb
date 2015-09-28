class SeedDataTables < ActiveRecord::Migration
  def change
    2.times do |i|
      RestaurantTable.create(capacity: 2)
    end

    2.times do |i|
      RestaurantTable.create(capacity: 4)
    end

    2.times do |i|
      RestaurantTable.create(capacity: 8)
    end
  end
end
