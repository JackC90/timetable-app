class Subject < ApplicationRecord
	has_many :slots
	has_many :timetable_subjects
	has_many :time_tables, through: :timetable_subjects

	scope :selected, -> (time_table_id) { joins(:time_tables).where("time_tables.id = ?", time_table_id) }
end
