class JewelsController < ApplicationController
  before_action :set_jewel, only: %i[show edit update destroy]
  def index
    @jewels = Jewel.all
  end

  def show
    @booking = Booking.new
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
    redirect_to jewels_url, notice: 'Jewel was successfully destroyed.'
  end

  private

  def set_jewel
    @jewel = Jewel.find(params[:id])
  end

  def jewel_params
    params.require(:jewel).permit(:title, :price, :description, :image_attachment)
  end
end
