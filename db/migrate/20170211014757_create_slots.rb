class CreateSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :slots do |t|
      t.string :day
      t.time :start_time
      t.time :end_time
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
