class UsersController < ApplicationController

  def my_profile
    @user = current_user
    @bookings = Booking.all
  end
end
