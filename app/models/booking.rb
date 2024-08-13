class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :appliance
end
