class RestaurantMailer < ApplicationMailer
	def reservation_created
		@cool="cool variable"
		mail(to: 'kira.pilot23@gmail.com', subject: 'Thar she blows!')
	end
end
