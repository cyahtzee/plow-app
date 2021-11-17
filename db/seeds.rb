require 'open-uri'

puts("deleting items...")
puts("deleting users...")
puts("creating admins")
Item.destroy_all
User.destroy_all
User.create!(first_name: "Matias", last_name: "Acuna", email: "agroang@gmail.com", password: "1234567")
User.create!(first_name: "Ryan", last_name: "Johnson", email: "ryan.a.y.johnson@gmail.com", password: "1234567")
User.create!(first_name: "Kostya", last_name: "Yatsenko", email: "moahtdeep@gmail.com", password: "1234567")
guest = User.create!(first_name: "Dirk", last_name: "Dirkinson", email: "honorable_user91@gmail.com", password: "1234567")

# file = File.open("db/fake_addresses.txt")
# file_data = file.readlines.map(&:chomp)
# addresses = file_data.split
# file.close
addresses = File.read("db/seed_helpers/fake_addresses.txt").split("\n")

File.foreach("db/seed_helpers/accessories.txt") do |line|
  price = (1000..10000).step((100..1000).to_a.sample.floor(-2)).to_a

  item = Item.new(category: "Accessories", condition: Item::CONDITIONS.sample, price_per_day: price.sample)
  item.location = addresses.sample
  item.title = "gloves"
  item.description = "Warm leather gloves"
  file = URI.open(line)
  item.photo.attach(io: file, filename: item.title, content_type: 'image/png')
  item.size = Item::SIZES.sample
  user = User.create!(last_name: Faker::Name.last_name, first_name: Faker::Name.first_name, email: Faker::Internet.email, password: "1234567")
  item.user = user
  item.save
  p "Created accessories..."
end

File.foreach("db/seed_helpers/binding.txt") do |line|
  price = (1000..10000).step((100..1000).to_a.sample.floor(-2)).to_a

  item = Item.new(category: "Bindings", condition: Item::CONDITIONS.sample, price_per_day: price.sample)
  item.location = addresses.sample
  item.title = "snowboard binding"
  item.description = "all round bindings"
  file = URI.open(line)
  item.photo.attach(io: file, filename: item.title, content_type: 'image/png')
  item.size = Item::SIZES.sample
  user = User.create!(last_name: Faker::Name.last_name, first_name: Faker::Name.first_name, email: Faker::Internet.email, password: "1234567")
  item.user = user
  item.save
  p "Created bindings..."
end

File.foreach("db/seed_helpers/headwear.txt") do |line|
  price = (1000..10000).step((100..1000).to_a.sample.floor(-2)).to_a

  item = Item.new(category: "Men's Headwear", condition: Item::CONDITIONS.sample, price_per_day: price.sample)
  item.location = addresses.sample
  item.title = "headware"
  item.description = "protects you from the cold and keep you safe."
  file = URI.open(line)
  item.photo.attach(io: file, filename: item.title, content_type: 'image/png')
  item.size = Item::SIZES.sample
  user = User.create!(last_name: Faker::Name.last_name, first_name: Faker::Name.first_name, email: Faker::Internet.email, password: "1234567")
  item.user = user
  item.save
  p "Created headware..."
end

File.foreach("db/seed_helpers/jackets.txt") do |line|
  price = (1000..10000).step((100..1000).to_a.sample.floor(-2)).to_a

  item = Item.new(category: ["Men's Jackets", "Women's Jackets"].sample, condition: Item::CONDITIONS.sample, price_per_day: price.sample)
  item.location = addresses.sample
  item.title = "ski jacket"
  item.description = "protects you from the cold and keep you dry no matter what you do."
  file = URI.open(line)
  item.photo.attach(io: file, filename: item.title, content_type: 'image/png')
  item.size = Item::SIZES.sample
  user = User.create!(last_name: Faker::Name.last_name, first_name: Faker::Name.first_name, email: Faker::Internet.email, password: "1234567")
  item.user = user
  item.save
  p "Created jackets..."
end

File.foreach("db/seed_helpers/poles.txt") do |line|
  price = (1000..10000).step((100..1000).to_a.sample.floor(-2)).to_a

  item = Item.new(category: "Poles", condition: Item::CONDITIONS.sample, price_per_day: price.sample)
  item.location = addresses.sample
  item.title = "ski poles"
  item.description = "don't forget to grab a pair of poles. It's always a good idea!"
  file = URI.open(line)
  item.photo.attach(io: file, filename: item.title, content_type: 'image/png')
  item.size = Item::SIZES.sample
  user = User.create!(last_name: Faker::Name.last_name, first_name: Faker::Name.first_name, email: Faker::Internet.email, password: "1234567")
  item.user = user
  item.save
  p "Created poles..."
end

File.foreach("db/seed_helpers/snowboard_boots.txt") do |line|
  price = (1000..10000).step((100..1000).to_a.sample.floor(-2)).to_a

  item = Item.new(category: ["Men's Boots", "Women's Boots"].sample, condition: Item::CONDITIONS.sample, price_per_day: price.sample)
  item.location = addresses.sample
  item.title = "boots"
  item.description = "Forgot about boots? No problem. It's always a good idea!"
  file = URI.open(line)
  item.photo.attach(io: file, filename: item.title, content_type: 'image/png')
  item.size = Item::SHOESIZES.sample
  user = User.create!(last_name: Faker::Name.last_name, first_name: Faker::Name.first_name, email: Faker::Internet.email, password: "1234567")
  item.user = user
  item.save
  p "Created snowboard boots..."
end

File.foreach("db/seed_helpers/snowboard.txt") do |line|
  price = (1000..10000).step((100..1000).to_a.sample.floor(-2)).to_a

  item = Item.new(category: "Snowboards", condition: Item::CONDITIONS.sample, price_per_day: price.sample)
  item.location = addresses.sample
  item.title = ["Park snowboard", "Powder snowboard", "Burton", "Beginners snowboard", "All round"].sample
  item.description = "Left your snowboard at home? No problem. Get it from me, it's always a good idea!"
  file = URI.open(line)
  item.photo.attach(io: file, filename: item.title, content_type: 'image/png')
  item.size = Item::LENGTH.sample
  user = User.create!(last_name: Faker::Name.last_name, first_name: Faker::Name.first_name, email: Faker::Internet.email, password: "1234567")
  item.user = user
  item.save
  p "Created snowaboards..."
end

File.foreach("db/seed_helpers/ski.txt") do |line|
  price = (1000..10000).step((100..1000).to_a.sample.floor(-2)).to_a

  item = Item.new(category: "Skis", condition: Item::CONDITIONS.sample, price_per_day: price.sample)
  item.location = addresses.sample
  item.title = ["Fat skis", "Powder skis", "Piste skis", "Beginners skis", "All round"].sample
  item.description = "Left your skis at home? Vacation is saved. Get it from me, it's always a good idea!"
  file = URI.open(line)
  item.photo.attach(io: file, filename: item.title, content_type: 'image/png')
  item.size = Item::LENGTH.sample
  user = User.create!(last_name: Faker::Name.last_name, first_name: Faker::Name.first_name, email: Faker::Internet.email, password: "1234567")
  item.user = user
  item.save
  p "Created skis..."
end
