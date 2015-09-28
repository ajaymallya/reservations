class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :customer_name
      t.integer :restaurant_table_id
      t.timestamp :reserved_at

      t.timestamps
    end
  end
end
