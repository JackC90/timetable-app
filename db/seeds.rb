# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



file = File.read("db/test_assignment.json")
data_hash = JSON.parse(file)

data_hash.each do |subject|
	new_subject = Subject.create(
		credits: subject["Credits"],
		name: subject["Name"]
	)
	subject["Classes"].each do |slot|
		new_subject.slots.create(
			day: slot["Day"],
			start_time: slot["StartTime"][-10..-3],
			end_time: slot["EndTime"][-10..-3]
		)
	end
end
