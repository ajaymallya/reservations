class AddGroupSizeToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :group_size, :integer
  end
end
