class User < ApplicationRecord
  has_many :appliances
  has_many :bookings, through: :appliances

  validates :username, presence: true
  validates :address, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
