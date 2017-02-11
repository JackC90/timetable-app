class CreateTimetableSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :timetable_subjects do |t|
      t.references :time_table, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
