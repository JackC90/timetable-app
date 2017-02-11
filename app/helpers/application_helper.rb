module ApplicationHelper
	def format_time(time)
		time.strftime("%I:%M %p")
	end

	def generate_days
		@days = Date::DAYNAMES[1..5].map{ |day| day[0..2] }
	end
end
