# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'destroying all users'
User.destroy_all
puts 'done destroying all users'

puts 'destroying all appliances'
Appliance.destroy_all
puts 'done destroying all appliances'

puts 'destroying all bookings'
Booking.destroy_all
puts 'done destroying all bookings'

puts 'creating fake users'
30.times do
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.phone_number,
    password: "azerty1234"
  )
end
puts 'done creating fake users'
puts 'creating fake appliances'

categories = ["Fondue Pot", "Raclette Machine", "Plancha", "Stone Grill", "Crepe Machine", "Barbeque", "Fryer"]
brands = ["Moulinex", "Tefal", "Seb", "Lagrange", "Bosch", "Philips", "Rowenta", "Electrolux", "Kenwood", "Kitchenaid", "Magimix", "Miele"]
genres = ["Fondue", "Racletteur", "Plancha", "Stone Grill", "La Crepe Machine", "Le Barbeque", "Le Fryer"]
versions = ["2000", "Chef", "3000", "Elite", "Excelsior", "Pro", "Master", "Deluxe", "Silver", "Black Edition", "Limited Edition", "Signature Edition"]
conditions = ["New", "Excellent", "Good", "Used", "Vintage"]
prices = (30..100).to_a
users = User.all

50.times do
  appliance = Appliance.new(
    name: "#{brands.sample} #{genres.sample} #{versions.sample}",
    category: categories.sample,
    condition: conditions.sample,
    description: Faker::Lorem.paragraph_by_chars(number: 128, supplemental: false),
    price: prices.sample.to_i,
    user_id: users.sample.id
    )
  appliance.save!
end

puts 'done creating fake appliances'
puts 'creating fake bookings'

def define_status(start_date, end_date)
  if end_date < Date.today
    return "Completed"
  elsif start_date <= Date.today && end_date >= Date.today
    return "Ongoing"
  else
    return ["Pending", "Upcoming"].sample
  end
end

30.times do
  user = users.sample
  booker = users.sample
  appliance = Appliance.all.sample
  booking = Booking.new(
    start_date: Faker::Date.between(from: 10.days.ago, to: 1.month.from_now),
    end_date: Faker::Date.between(from: 8.days.ago, to: 2.month.from_now),
    booker_comment: Faker::Lorem.paragraph_by_chars(number: 128, supplemental: false),
    owner_id: user.id,
    appliance_id: appliance.id,
    booker_id: booker.id
  )
  status = define_status(booking.start_date, booking.end_date)
  booking[:status] = status
  if status == "Pending"
    booking[:owner_comment] = nil
  else
    booking[:owner_comment] = Faker::Lorem.paragraph_by_chars(number: 128, supplemental: false)
  end
  booking.save!
end
