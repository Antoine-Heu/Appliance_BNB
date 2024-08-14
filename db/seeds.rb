# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'create fake appliances'

user_one = User.create!(
  email: "georges2q@wdhqh.com",
  username: "Georges",
  address: "truc much",
  phone: "654684165165",
  password: "azerty1234"
)

raclette = Appliance.new(
  name: "Raclette machine",
  category: "raclette machine",
  condition: "New",
  description: "Super produit pour passer votre noël en famille",
  price: "30€",
  user_id: user_one.id
  )
raclette.save!

chocolate = Appliance.new(
  name: "Chocolate machine",
  category: "fondue pot",
  condition: "Good",
  description: "Super produit pour passer votre noël en famille",
  price: "15€",
  user_id: user_one.id
)
chocolate.save!

puts 'done'
