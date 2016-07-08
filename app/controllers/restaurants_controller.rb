class RestaurantsController < ApplicationController


  before_action :find_restaurant, :only => [:show, :edit, :update, :destroy]  

  def index
  	@restaurants = Restaurant.all
  end

  def new
  	@restaurant = Restaurant.new
  end

  def create
  	@restaurant = Restaurant.new(restaurant_params)
	if @restaurant.save
		redirect_to @restaurant
	else
		render 'new'
	end
  end

  def show
  	@restaurant = Restaurant.find(params[:id])
  end
end


