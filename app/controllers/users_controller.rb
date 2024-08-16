class UsersController < ApplicationController
  before_action :authenticate_user!

  def my_profile
    @user = current_user
    @appliances = current_user.appliances

    if params[:filter]
      @bookings = current_user.bookings.where(status: params[:filter])
      @appliances = @bookings.map(&:appliance)
    end

    if params[:selection]
      @offers = Booking.all.where(owner_id: current_user.id)
      @received_offers = @offers.where(status: params[:selection])
      @offers_appliances = @offers.map(&:appliance)
    end
  end
end
