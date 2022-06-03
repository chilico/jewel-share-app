class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @jewels = @user.jewels
    @bookings = @user.bookings
    @markers = {
      lat: @user.latitude,
      lng: @user.longitude
    }
  end
end
