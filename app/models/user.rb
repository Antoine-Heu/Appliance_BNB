class User < ApplicationRecord
  has_many :appliances
  has_many :bookings

end
