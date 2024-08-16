# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

image_directory_path = Rails.root.join('lib', 'assets')
puts image_directory_path
# Vérifiez que le répertoire d'images existe
image_files = Dir.entries(image_directory_path).select do |file|
  # Filter out '.' and '..' and ensure it's a file (not a directory)
  !File.directory?(File.join(image_directory_path, file))
end
# Vérifiez qu'il y a des fichiers d'image dans le répertoire
unless image_files.any?
  raise "No image files found in directory: #{image_directory_path}"
end



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

categories = ["Fondue pot", "Raclette machine", "Plancha", "Stone Grill", "Crepe Machine", "Barbecue", "Fryer"]
brands = ["Moulinex", "Tefal", "Seb", "Lagrange", "Bosch", "Philips", "Rowenta", "Electrolux", "Kenwood", "Kitchenaid", "Magimix", "Miele"]
genres = ["Fondue", "Racletteur", "Plancha", "Stone Grill", "La Crepe Machine", "Le Barbeque", "Le Fryer"]
versions = ["2000", "Chef", "3000", "Elite", "Excelsior", "Pro", "Master", "Deluxe", "Silver", "Black Edition", "Limited Edition", "Signature Edition"]
conditions = ["New", "Excellent", "Good", "Used", "Vintage"]
prices = (30..100).to_a
users = User.all

# images = {
#   "Fondue pot" => ["../lib/assets/fondu 1.jpg, ../lib/assets/fondu 2.jpg, ../lib/assets/fondu 3.jpg, ../lib/assets/fondu 4.jpg, ../lib/assets/fondu 5.jpg, ../lib/assets/fondu 6.jpg, ../lib/assets/fondu 7.jpg, ../lib/assets/fondu 8.jpg, ../lib/assets/fondu 9.jpg, ../lib/assets/fondu 10.jpg"],
#   "Raclette machine" => ["../lib/assets/raclette 1.webp", "../lib/assets/raclette 2.webp", "../lib/assets/raclette 3.webp", "../lib/assets/raclette 4.webp", "../lib/assets/raclette 5.webp", "../lib/assets/raclette 6.webp", "../lib/assets/raclette 7.webp", "../lib/assets/raclette 8.webp", "../lib/assets/raclette 9.webp", "../lib/assets/raclette 10.webp"],
#   "Plancha" => ["../lib/assets/plancha 1.jpg", "../lib/assets/plancha 2.jpg", "../lib/assets/plancha 3.jpg", "../lib/assets/plancha 4.jpg", "../lib/assets/plancha 5.jpg", "../lib/assets/plancha 6.jpg", "../lib/assets/plancha 7.jpg", "../lib/assets/plancha 8.jpg", "../lib/assets/plancha 9.jpg", "../lib/assets/plancha 10.jpg"],
#   "Stone Grill" => ["../lib/assets/pierrade 1.webp", "../lib/assets/pierrade 2.webp", "../lib/assets/pierrade 3.webp", "../lib/assets/pierrade 4.webp", "../lib/assets/pierrade 5.webp", "../lib/assets/pierrade 6.webp", "../lib/assets/pierrade 7.webp", "../lib/assets/pierrade 8.webp", "../lib/assets/pierrade 9.webp", "../lib/assets/pierrade 10.webp"],
#   "Crepe Machine" => ["../lib/assets/crepe 1.jpg", "../lib/assets/crepe 2.jpg", "../lib/assets/crepe 3.jpg", "../lib/assets/crepe 4.jpg", "../lib/assets/crepe 5.jpg", "../lib/assets/crepe 6.jpg", "../lib/assets/crepe 7.jpg", "../lib/assets/crepe 8.jpg", "../lib/assets/crepe 9.jpg", "../lib/assets/crepe 10.jpg"],
#   "Barbecue" => ["../lib/assets/bbq 1.jpg", "../lib/assets/bbq 2.jpg", "../lib/assets/bbq 3.jpg", "../lib/assets/bbq 4.jpg", "../lib/assets/bbq 5.jpg", "../lib/assets/bbq 6.jpg", "../lib/assets/bbq 7.jpg", "../lib/assets/bbq 8.jpg", "../lib/assets/bbq 9.jpg", "../lib/assets/bbq 10.jpg"],
#   "Fryer" => ["../lib/assets/friteuse 1.jpg", "../lib/assets/friteuse 2.jpg", "../lib/assets/friteuse 3.jpg", "../lib/assets/friteuse 4.jpg", "../lib/assets/friteuse 5.jpg", "../lib/assets/friteuse 6.jpg", "../lib/assets/friteuse 7.jpg", "../lib/assets/friteuse 8.jpg", "../lib/assets/friteuse 9.jpg", "../lib/assets/friteuse 10.jpg"]
# }

50.times do

  image_file = image_files.sample
  image_path = File.join(image_directory_path, image_file)

  appliance = Appliance.new(
    name: "#{brands.sample} #{genres.sample} #{versions.sample}",
    category: categories.sample,
    condition: conditions.sample,
    eaters: [2, 4, 6, 8, 10, 12].sample,
    description: Faker::Lorem.paragraph_by_chars(number: 128, supplemental: false),
    price: prices.sample.to_i,
    user_id: users.sample.id
    )

    extension = File.extname(image_file).delete('.')
    content_type = "image/#{extension}"

    appliance.photo.attach(
      io: File.open(image_path),
      filename: image_file,
      content_type: content_type
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
