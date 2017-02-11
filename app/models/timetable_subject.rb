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
      if slot.day != full_slot.day
        @no_overlap = true
      else
			 @no_overlap = (slot.start_time - full_slot.end_time) * (full_slot.start_time - slot.end_time) >= 0
      end 
			break if @no_overlap == false		 
		end
    break if @no_overlap == false
	end 
	@no_overlap
  end
end
