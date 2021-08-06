require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying Database "
  Safari.destroy_all
  Hotel.destroy_all
  Attraction.destroy_all
  User.destroy_all
puts "Database destroyed"

puts "Creating Users"
User.create( email: "gonzalo@test.com", password:"123123123" )

puts "Creating Safaris"
3.times do
  Safari.create!(
      user: User.first,
      banner_image: Faker::LoremPixel.image,
      title: Faker::Name.name,
      expect: Faker::Lorem.sentences,
      description: Faker::Lorem.sentences,
      itinerary_description: Faker::Lorem.sentences,
      price: Faker::Number.number(4),
      hotels_description: Faker::Lorem.sentences,
      includes_description: Faker::Lorem.sentences
    )
end

Safari.create!(
    user: User.first,
    banner_image: Faker::LoremPixel.image,
    title: Faker::Name.name,
    expect: Faker::Lorem.sentences,
    description: Faker::Lorem.sentences,
    itinerary_description: Faker::Lorem.sentences,
    price: Faker::Number.number(4),
    hotels_description: Faker::Lorem.sentences,
    includes_description: Faker::Lorem.sentences
  )

puts "Safaris created."


puts "Creating Hotels"
3.times do
  Hotel.create!(
      user: User.first,
      title: Faker::Name.name,
      description: Faker::Lorem.sentences(2),
      price_night: Faker::Number.number(4)
    )
end

puts "Hotels Created"


puts "Creating Attractions"
3.times do
  Attraction.create!(
      user: User.first,
      title: Faker::Name.name,
      description: Faker::Lorem.sentences(2),
      image: "https://source.unsplash.com/random:"
    )
end

puts "Attractions Created"
