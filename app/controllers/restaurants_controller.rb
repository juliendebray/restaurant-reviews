class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    if restaurant.save
      flash[:notice] = "Restaurant #{restaurant.name} has been created"
      redirect_to restaurant_path(restaurant)
    else
      redirect_to new_restaurant_path
    end
  end

  def show
    @new_review = @restaurant.reviews.new
    @new_review = Review.new(restaurant_id: @restaurant.id)
  end

  private
  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone, :category)
  end

end
