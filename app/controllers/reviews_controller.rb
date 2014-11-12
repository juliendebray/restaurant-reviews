class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = "Review #{@review.id} has been added"
      redirect_to restaurant_path(@review.restaurant)
    else
      flash[:notice] = @review.errors.full_messages
      redirect_to restaurant_path(@review.restaurant) #how to use render method?
    end
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end

end
