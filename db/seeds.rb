require 'open-uri'

puts("deleting items...")
puts("deleting users...")
User.destroy_all
Item.destroy_all

addresses = File.read("./seed_helpers/fake_addresses.txt.txt").split
File.foreach("./ski_seeds.txt") do |line|
price = [1000, 1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000]
item = Item.new(category: "Skis", condition: CONDITIONS.sample, price_per_day: price.sample)
item.location = addresses.sample
file = URI.open(line)
item.images.attach(io: file, content: 'image/png')
user = User.new(email: Faker::Internet.email, password: "1234567")
user.item = item
end
