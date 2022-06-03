class ReviewsController < ApplicationController
  before_action :set_jewel, only: %i[new create]

  def create
    @review = Review.new(review_params)
    @review.jewel = @jewel
    @booking = Booking.new
    if @review.save
      redirect_to jewel_path(@jewel)
    else
      render 'jewels/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to jewel_path(@review.jewel), status: :see_other
  end

  private

  def set_jewel
    @jewel = Jewel.find(params[:jewel_id])
  end

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
end
