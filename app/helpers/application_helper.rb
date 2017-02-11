module ApplicationHelper
	def format_time(time)
		time.strftime("%I:%M %p")
	end

	def generate_times
		@times = Array.new
		time = Tod::TimeOfDay.parse "8:30am"
		while time < Tod::TimeOfDay.parse("7:00pm") do
			@times << format_time(time)
			time += 30.minutes
		end
		@times
	end

	def generate_days
		@days = Date::DAYNAMES[1..5].map{ |day| day[0..2] }
	end
end
