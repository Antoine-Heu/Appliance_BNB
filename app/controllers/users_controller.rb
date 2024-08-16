class UsersController < ApplicationController
  before_action :authenticate_user!

  def my_profile
    @user = current_user

    if params[:filter]
      @bookings = current_user.bookings.where(status: params[:filter])
      @appliances = @bookings.map(&:appliance)
    end

  end
end
