class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.save
    flash[:notice] = "Review #{@review.id} has been added"
    redirect_to restaurant_path(@review.restaurant)
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end

end
