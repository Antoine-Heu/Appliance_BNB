class Appliance < ApplicationRecord
  has_one_attached :photo
  include PgSearch::Model
  pg_search_scope :search_by_name_description_and_price,
    against: [:name, :description, :price],
    associated_against: {
      user: [:username]
    },
    using: {
      tsearch: { prefix: true }
    }

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
