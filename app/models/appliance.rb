class Appliance < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :name, presence: true
  validates :price, presence: true
  validates_length_of :description, minimum: 10

  CATEGORIES = ["Fondue pot", "Raclette machine", "Plancha", "Stone Grill", "Crepe Machine", "Barbecue", "Fryer"]

  validates_inclusion_of :category, in: CATEGORIES
  CONDITIONS = ["New", "Excellent", "Good", "Used", "Vintage"]
  validates_inclusion_of :condition, in: CONDITIONS
end
