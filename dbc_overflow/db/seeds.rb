# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

10.times do 
	User.create(name: Faker::Name.first_name.downcase, 
							email: Faker::Internet.email,
							password: "password",
  						password_confirmation: "password")
end

User.all.each do |user|
	user.questions.create(title: Faker::Lorem.sentence,
												content: Faker::Lorem.paragraph)
end


User.all.each do |user|
	Question.all.each do |question|
		question.answers.create(content: Faker::Lorem.paragraph,
														user_id: user.id)
	end
end



