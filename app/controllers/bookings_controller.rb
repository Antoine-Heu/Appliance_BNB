class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @appliance = Appliance.find(params[:appliance_id])
  end

  def create
    @booking = Booking.new(bookings_params)
    @appliance = Appliance.find(params[:appliance_id])
    @booking.owner = @appliance.user
    @booking.appliance = @appliance
    @booking.booker = current_user
    @booking.status = "Pending"
    if @booking.save
      redirect_to root_path, notice: "Booking request sent!"
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:booker_comment, :start_date, :end_date)
  end
end
