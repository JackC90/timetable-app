class TimetableSubject < ApplicationRecord
  belongs_to :time_table
  belongs_to :subject

  validates :time_table_id, uniqueness: {scope: :subject_id}
  validate :not_overlapping 

  def not_overlapping
  	own_slots = self.subject.slots
  	selected_subjects = Subject.selected(self.time_table_id).pluck(:id)
  	full_slots = Slot.where(subject_id: selected_subjects)

	own_slots.each do |slot|
		full_slots.each do |full_slot|
			@no_overlap = (slot.start_time - full_slot.end_time) * (full_slot.start_time - slot.end_time) >= 0

			break if @no_overlap == false		 
		end
	end 
	@no_overlap
  end
end
