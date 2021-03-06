# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..10).each do |n|
  User.create(username: 'johndoe' + "#{n}", email: 'johndoe' + "#{n}" + '@foo.com', password: 'pass1234')
end

(1..5).each do |n|
  Pet.create(name: 'Pet' + "#{n}", date_of_birth: '2014-10-10', user_id: 1)
end

Event.create(title: 'Vet visit',
             description: 'Lorem ipsum sit dolot ament',
             date: '2014-12-30',
             time: '12:00',
             user_id: 1,
             pet_id: 1)
