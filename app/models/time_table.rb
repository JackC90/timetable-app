class TimeTable < ApplicationRecord
	has_many :timetable_subjects
	has_many :subjects, through: :timetable_subjects

	def total_credits
		credits = Subject.selected(self.id).pluck(:credits)
		credits.inject(:+)
	end
end
