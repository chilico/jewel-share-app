class BookingsController < ApplicationController
  def create
    @jewel = Jewel.find(params[:jewel_id])
    @booking = Booking.new(booking_params)
    @booking.jewel = @jewel
    if @booking.save
      redirect_to jewel_path(@jewel)
    else
      render 'jewels/show', status: unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_data, :user_id)
  end
end
