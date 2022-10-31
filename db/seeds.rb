# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



require "faker"

10.times do		#cree 10 villes
	cities = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip)
end

10.times do        #cree 10 user avec une ville en reference
    users = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Quote.famous_last_words, mail: Faker::Internet.email, age: rand(18..99), city_id:41)
end

20.times do     #cree 20 gossips en references avec user
   gossips = Gossip.create(title: Faker::Name.name, content: Faker::ChuckNorris.fact, user_id: rand(1..10))
end


