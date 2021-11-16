require 'open-uri'

puts("deleting items...")
puts("deleting users...")
puts("creating admins")
User.destroy_all
User.new(first_name: "Matias", last_name: "Acuna", email: "agroang@gmail.com", password: "1234567")
User.new(first_name: "Ryan", last_name: "Johnson", email: "ryan.a.y.johnson@gmail.com", password: "1234567")
User.new(first_name: "Kostya", last_name: "Yatsenko", email: "moahtdeep@gmail.com", password: "1234567")
User.new(first_name: "Dirk", last_name: "Dirkinson", email: "honorable_user91@gmail.com", password: "1234567")
Item.destroy_all

addresses = File.read("./seed_helpers/fake_addresses.txt").split
File.foreach("./ski_seeds.txt") do |line|
price = [1000, 1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000]
CATEGORIES.each do |category|
  item = Item.new(category: category, condition: CONDITIONS.sample, price_per_day: price.sample)
  item.location = addresses.sample
  file = URI.open(line)
  item.images.attach(io: file, content: 'image/png')
end
user = User.new(email: Faker::Internet.email, password: "1234567")
item.user = user
end
