class Slot < ApplicationRecord
  belongs_to :subject

  def duration
  	self.end_time - self.start_time
  end

  def periods
  	self.duration / (30 * 60)
  end
end
