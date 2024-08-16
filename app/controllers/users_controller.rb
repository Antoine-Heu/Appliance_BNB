class UsersController < ApplicationController
  before_action :authenticate_user!

  def my_profile
    @user = current_user

    if params[:filter]
      @proposals = Booking.where(booker_id: current_user.id)
      @sent_proposals = @proposals.where(status: params[:filter])
    end

    if params[:selection]
      @offers = Booking.all.where(owner_id: current_user.id)
      @received_offers = @offers.where(status: params[:selection])
    end
  end
end
