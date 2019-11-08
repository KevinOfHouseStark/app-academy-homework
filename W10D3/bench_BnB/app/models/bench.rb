class Bench < ApplicationRecord
  validates :description, :lat, :lng, :seat_capacity, presence: true


end