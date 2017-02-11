json.extract! timetable_subject, :id, :time_table_id, :subject_id, :created_at, :updated_at
json.url timetable_subject_url(timetable_subject, format: :json)