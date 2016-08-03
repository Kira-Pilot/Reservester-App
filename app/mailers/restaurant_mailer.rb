class RestaurantMailer < ApplicationMailer
	def reservation_created
		
		mail(to: 'kira.pilot23@gmail.com', subject: 'Thar she blows!')
	end
end
