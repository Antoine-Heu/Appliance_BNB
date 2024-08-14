class Booking < ApplicationRecord
  belongs_to :booker, class_name: "User", foreign_key: :booker_id
  belongs_to :appliance
  belongs_to :owner, class_name: "User", foreign_key: :owner_id

  validates :start_date, presence: true
  validates :end_date, presence: true
  STATUS = ["Pending", "Accepted", "Declined", "Completed"]
  validates_inclusion_of :status, in: STATUS
  validates_length_of :owner_comment, minimum: 10
  validates_length_of :booker_comment, minimum: 10, if: :pending?

  def pending?
    status == "Pending"
  end
end
