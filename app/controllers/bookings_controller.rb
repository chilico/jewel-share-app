class BookingsController < ApplicationController
  def create
    @jewel = Jewel.find(params[:jewel_id])
    @booking = Booking.new(booking_params)
    @booking.jewel_id = @jewel
    @booking.user_id = current_user
    if @booking.save
      raise
      redirect_to my_bookings_path
    else
      raise
      render 'jewels/show', status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(Date.parse(:booking[:start_date]), Date.parse(:booking[:end_date]))
  end
end
