class Reservation < ActiveRecord::Base
  belongs_to :restaurant_table

  scope :for_tables, ->(table_id){ where(restaurant_table_id: table_id) }
  scope :reserved_at, ->(timestamp){ where(reserved_at: timestamp).pluck(:restaurant_table_id) }

  validates_presence_of :restaurant_table_id, message: "not available for your group size"
  validates_presence_of :customer_name, message: "cannot be blank"
  validates_presence_of :group_size, message: "cannot be blank"
  validates_numericality_of :group_size, message: "must be a number"
end
