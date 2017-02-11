class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :time_array, :time_line

  def time_array(time_table_id)
  	@array = Array.new
  	Subject.selected(time_table_id).each do |subject|
  		subject.slots.each do |slot|
  			@array << [slot.day, slot.start_time.to_s, slot.end_time.to_s]
  		end
  	end
  	@array
  end

  def time_line
  	@times = Array.new
		time = Time.parse("2000-01-01 08:30:00 UTC")
		while time < Time.parse("2000-01-01 19:00:00 UTC") do
			@times << time
			time += 30.minutes
		end
	@times
  end
end
