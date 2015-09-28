class RestaurantTable < ActiveRecord::Base
  has_many :reservations

  scope :with_capacity, ->(capacity){where("capacity >= ?", capacity).pluck(:id)}
end
