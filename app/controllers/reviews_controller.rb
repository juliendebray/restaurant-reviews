class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @new_review     = @restaurant.reviews.new(review_params)

    if @new_review.save
      flash[:notice] = "Review #{@new_review.id} has been added"
      redirect_to restaurant_path(@restaurant)
    else
      flash.now[:alert] = @new_review.errors.full_messages
      render 'restaurants/show'
      # redirect_to restaurant_path(@review.restaurant) #how to use render method?
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
