class ReservationsController < ApplicationController

before_action :get_restaurant

def index
	@reservation = Reservation.all
end

def new
    @reservation = @restaurant.reservations.new
    
end

def create
	#What is this, here? And why doesn't it follow the same @restaurant.reservations format, above?
	@reservation = Reservation.new(reservation_params)
	if @reservation.save
		#We'll want to add a line here: ReservationMailer.confirm_email(@restaurant.user).deliver
		flash[:success] = "Congrats! Reservation number #{@reservation.id} created!"
		#In Ruby, what does the below mean? And what's the difference between that and render?
		redirect_to restaurant_reservation_path(restaurant_id: @reservation.restaurant.id, id: @reservation.id)
	else
		render 'new'
	end
end

def show
	@reservation = @restaurant.reservations.find(params[:id])
	if @reservation
      render :show
    else
      flash[:warning] = "Sorry! That reservation doesn't exist."
      redirect_to new_restaurant_reservation_path
    end
end

def edit
	@reservation = @restaurant.reservations.find(params[:id])
end

def update
	@reservation = @restaurant.reservations.find(params[:id])
	if @restaurant.reservations.update(reservation_params)
		redirect_to restaurant_reservation_path
	else
		render 'edit'
	end
end

def destroy
	@reservation = @restaurant.reservations.find(params[:id])
	@reservation.destroy
	redirect_to restaurants_path
end

	private

def reservation_params
	params.require(:reservation).permit(:email, :restaurant_id, :reserve_time, :reserve_date, :message)
end

def get_restaurant
	@restaurant = Restaurant.find(params[:restaurant_id])
end

end
