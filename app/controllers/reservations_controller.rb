class ReservationsController < ApplicationController

before_action :get_restaurant

def index
	@reservation = Reservation.all
end

# def new
# 	@reservation = Reservation.new
# 	@restaurant = Restaurant.find(params[:id])
# end
#what the hell does the below mean?
before_action :get_restaurant

def new
    @reservation = @restaurant.reservations.new
    #@restaurant = Restaurant.find(@reservation.restaurant_id)
end

def create
	@reservation = Reservation.new(reservation_params)
	#@restaurant = Restaurant.find_by_id(@reservation.restaurant_id)
	if @reservation.save
		#ReservationMailer.confirm_email(@restaurant.user).deliver
		#flash[:success] = "#{@reservation.id} created"
		redirect_to restaurant_reservation_path(restaurant_id: @restaurant.id, id: @reservation.id)
	else
		#flash[:warning] = @reservation.errors.inspect
		#redirect_to new_reservation_path
		render 'new'
	end
end

def show
	@reservation = Reservation.find(params[:id])
	@restaurant = Restaurant.find(@reservation.restaurant_id)
	#if @reservation
		#render :show
	# else
	# 	flash[:warning] = "Sorry! That reservation doesn't exist."
	# 	redirect_to root_path
	#end
end

def edit
	@reservation = Reservation.find(params[:id])
end

def update
	@reservation = Reservation.find(params[:id])
	if @reservation.update(reservation_params)
		redirect_to [@reservation, @reservation]
	else
		render 'edit'
	end
end

def destroy
	@reservation = Reservation.find(params[:id])
	@reservation.destroy
	redirect_to restaurants_path
end

	private

def reservation_params
	params.require(:reservation).permit(:name, :restaurant_id, :reserve_time, :reserve_date)
end

def get_restaurant
	@restaurant = Restaurant.find(params[:restaurant_id])
end

end
