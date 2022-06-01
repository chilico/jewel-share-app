class BookingsController < ApplicationController
  def create
    @jewel = Jewel.find(params[:jewel_id])
    @booking = Booking.new(booking_params)
    @booking.jewel_id = @jewel.id
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to my_bookings_path, notice: 'Booking was successfully created.'
    else
      render 'jewels/show', status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
