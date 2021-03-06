class JewelsController < ApplicationController
  before_action :set_jewel, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @jewels = Jewel.all
    if params[:query].present?
      sql_query = <<~SQL
        jewels.title @@ :query
        OR jewels.description @@ :query
        OR users.first_name @@ :query
        OR users.last_name @@ :query
        OR users.address @@ :query
      SQL
      @jewels = Jewel.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @jewels = Jewel.all
    end
  end

  def show
    @booking = Booking.new
    @review = Review.new
    @user = @jewel.user
    @markers = {
      lat: @user.latitude,
      lng: @user.longitude
    }
  end

  def new
    @jewel = Jewel.new
  end

  def create
    @jewel = Jewel.new(jewel_params)
    @jewel.user = current_user
    if @jewel.save
      redirect_to @jewel, notice: 'Jewel was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @jewel.update(jewel_params)
      redirect_to @jewel, notice: 'Jewel was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @jewel.destroy
    redirect_to root_path, notice: 'Jewel was successfully destroyed.', status: :see_other
  end

  private

  def set_jewel
    @jewel = Jewel.find(params[:id])
  end

  def jewel_params
    params.require(:jewel).permit(:title, :price, :description, photos: [])
  end
end
