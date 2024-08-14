class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @appliance = Appliance.find(params[:id])
  end

  def create
    @booking = Booking.new(bookings_params)
    @appliance = Appliance.find(params[:id])
    @booking.owner = @booking.appliance.user
    @booking.appliance = @appliance
    @booking.booker = current_user
    if @booking.save
      redirect_to user_path(current_user)
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:booker_comment, :start_date, :end_date)
  end
end
