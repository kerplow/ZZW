# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chuck = User.find_by(email: 'charlesdegh@gmail.com')
chuck.update(admin: true)
chuck.save!


# 20.times do |n|
#   user = User.new
#   user.first_name = Faker::Name.first_name
#   user.last_name = Faker::Name.last_name
#   user.nickname = Faker::DragonBall.character
#   user.bio = Faker::MostInterestingManInTheWorld.quote
#   user.room = n
#   user.phone_number = Faker::PhoneNumber.phone_number
#   user.email = Faker::Internet.email
#   user.password = 'password'
#   user.save!
# end
#
# 20.times do
#   event = PlannerEvent.new
#   event.name = Faker::GameOfThrones.character
#   event.description = Faker::GameOfThrones.quote
#   event.start_time = rand(100).hours.from_now
#   event.end_time = event.start_time + rand(1..10).hours
#   event.save!
# end
#
# 20.times do
#   note = Note.new
#   note.name = Faker::WorldOfWarcraft.hero
#   note.contents = Faker::WorldOfWarcraft.quote
#   note.save!
# end

# default lists:
list = List.first_or_create(title: 'Subtitle', user: chuck)
list.save

list = List.first_or_create(title: 'Suggestions', user: chuck)
list.save

p 'seed done'