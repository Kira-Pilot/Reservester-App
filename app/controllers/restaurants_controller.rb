class RestaurantsController < ApplicationController

before_action :authenticate_owner!, except: [:show,:index]

#before_action :set_restaurant, only: [:show]

def index
	@restaurant = Restaurant.all
end

def new
	@restaurant = current_owner.restaurants.new
end

def create
	@restaurant = current_owner.restaurants.new(restaurant_params)
	if @restaurant.save
		flash[:success] = "Restaurant was successfully created."
	  redirect_to restaurant_path(@restaurant)
	else
	render 'new'
	end
end

def show
	@restaurant = Restaurant.find(params[:id])
end

def edit
	@restaurant = current_owner.restaurants.find(params[:id])	
end

def update
	@restaurant=current_owner.restaurants.find(params[id])
	if @restaurant.update(restaurant_params)
		flash[:success] = "Restaurant was successfully updated."
		redirect_to restaurant_path(@restaurant)
	else 
		render 'edit'
	end
end

def destroy
	@restaurant=current_owner.restaurants.find(params[:id])
	if @restaurant.destroy
		flash[:danger] = "Restaurant was successfully deleted."
		redirect_to restaurants_path
	else
		flash[:danger] = "Restaurant was not deleted!"
		redirect_to restaurants_path
	end
end

  private

  def restaurant_params
  	params.require(:restaurant).permit(:name, :description, :address, :phone)
  end
end


