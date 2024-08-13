class Appliance < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :name, presence: true
  validates :price, presence: true
  validates_length_of :description, min: 10
  TYPES = ["fondue pot", "raclette machine", "plancha", "Stone Grill", "Crepe Machine", "Barbeque", "Fryer"]
  validates_inclusion_of :type, in: TYPES
  CONDITIONS = ["New", "Excellent", "Good", "Used", "Vintage"]
  validates_inclusion_of :condition, in: CONDITIONS
end
