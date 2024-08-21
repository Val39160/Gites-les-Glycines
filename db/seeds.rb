# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Destroying all bookings, reviews, rooms and users..."
Room.destroy_all
User.destroy_all
puts "Creating a user..."
User.create({
  :email => "valentin.corger@gmail.com",
  :password => "password"
})

puts "Creating rooms..."
Room.create({
  :name => "Gite Jonquille" ,
  :description => "Chambre double avec salle de bain privée",
  :price_per_day => 50.0,
  :average_rating => 4.5,
  :number_of_guests => 4
})

Room.create({
  :name => "Gite Lila",
  :description => "Chambre double avec salle de bain privée",
  :price_per_day => 75.0,
  :average_rating => 4.0,
  :number_of_guests => 4
})

Room.create({
  :name => "Gite Acacia",
  :description => "Chambre double avec salle de bain privée",
  :price_per_day => 100.0,
  :average_rating => 4.5,
  :number_of_guests => 4
})

Room.create({
  :name => "Gite Glycine",
  :description => "Chambre double avec salle de bain privée",
  :price_per_day => 125.0,
  :average_rating => 4.0,
  :number_of_guests => 4
})

puts "Seeding done!"
