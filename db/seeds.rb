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
  titles = ['Mitts', "5 finger", "Gloves", 'Padded gloves']
  descriptions = ['Look a bit old but in great condition', 'Will keep you warm and dry at any cost', "Good realiable brand. I only used those for one season"]
  item = Item.new(category: "Accessories", condition: Item::CONDITIONS.sample, price_per_day: price.sample)
  item.location = addresses.sample
  item.title = titles.sample
  item.description = descriptions.sample
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
  titles = ['Snowboard bindings', "Adjustible bindings", "Bindings"]
  descriptions = ['Great bindings for all round sgredding', "Still have lots of life in it. I bought a new snowboard and I cannot use these anymore.", "Very light weight bindings. Perform great on piste."]
  item.location = addresses.sample
  item.title = titles.sample
  item.description = descriptions.sample
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

  titles = ["Men's Helmet", "Women's helmet", "Kid's helmet", 'Wall breaker']
  descriptions = ["protects you from the cold and keep you safe.", "Helmet is a very important item on your list.", "Don't ruin your vacation, helmet can save your life.", 'Brand new with th latest safety technologies included.']
  item = Item.new(category: "Men's Headwear", condition: Item::CONDITIONS.sample, price_per_day: price.sample)
  item.location = addresses.sample
  item.title = titles.sample
  item.description = descriptions.sample
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

  titles = ["Light duke", "Wind breaker", "Ak Junior", "Shredder", "Flaker", "Snowhite", "Rolling deep"]
  descriptions = ["Protects you from the cold and keep you dry no matter what you do.", "Durable and sturdy. Padded outwear with many pockets", "Lightweight and doesn't restrict the movements"]
  item = Item.new(category: ["Men's Jackets", "Women's Jackets"].sample, condition: Item::CONDITIONS.sample, price_per_day: price.sample)
  item.location = addresses.sample
  item.title = titles.sample
  item.description = descriptions.sample
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

  titles = ["Light duke", "Wind breaker", "Ak Junior", "Shredder", "Flaker", "Snowhite", "Rolling deep"]
  descriptions = ["Collapseable pair of poles.", "Adjustable poles.", "A litle old but still work very well.", "Get skis and get poles on the house."]
  item = Item.new(category: "Poles", condition: Item::CONDITIONS.sample, price_per_day: price.sample)
  item.location = addresses.sample
  item.title = titles.sample
  item.description = descriptions.sample
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

  titles = ["Light duke", "Brown wing", "Grey wizzard", "Snoop", "Stripes", "", "Walker"]
  descriptions = ["Custom Fit Liner – Heat moldable Ultralon foam liners with strategically placed multidensity foams for heel retention.", "Imprint – This boot features a high comfort and long-lasting insole.", "D-Light Outsole – Lightweight and ultra-low profile, this full EVA D-Light Outsole features extra gridding under the feet for added comfort and damping right where you need it."]
  item = Item.new(category: ["Men's Boots", "Women's Boots"].sample, condition: Item::CONDITIONS.sample, price_per_day: price.sample)
  item.location = addresses.sample
  item.title = titles.sample
  item.description = descriptions.sample
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

  titles = ["Flight atander", "Shredder", "Widow maker", "Black crows", "Yellow wings", "El Diablo"]
  descriptions = ["Good all rounder, freat performance on piste.", "Good on piste, a bit heavy for the deeper snow.", "Because sometimes the best backcountry experiences come with mixed conditions and unexpected terrain, you need a board that rises to every challenge.", "From floating through open powder stashes to working through variable conditions, its versatility shines bright no matter where you wind up.", "The flat, ultra-thin, and skate-like profile improves the ride, thanks to Filet-O-Flex design, yet rips harder than any soft board out there."]
  item = Item.new(category: "Snowboards", condition: Item::CONDITIONS.sample, price_per_day: price.sample)
  item.location = addresses.sample
  item.title = titles.sample
  item.description = descriptions.sample
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

  titles = ["Flight atander", "Shredder", "Widow maker", "Black crows", "Yellow wings", "El Diablo"]
  descriptions = ["The new Salomon Aira 84 Ti is a fantastic option for aggressive skiing women who will spend the majority of their time on the frontside of the mountain.", "A Ti Power Zone adds extra rigidity underfoot and more power.", "A Semi Sandwich Sidewall gives a perfect blend of torsional rigidity and flex for intermediate riders who are still learning to push into the ski to get the most out of it.", "An awesome option for intermediate to advanced level ladies looking for a solid frontside ski for all day fun on the mountain."]
  item = Item.new(category: "Skis", condition: Item::CONDITIONS.sample, price_per_day: price.sample)
  item.location = addresses.sample
  item.title = titles.sample
  item.description = descriptions.sample
  file = URI.open(line)
  item.photo.attach(io: file, filename: item.title, content_type: 'image/png')
  item.size = Item::LENGTH.sample
  user = User.create!(last_name: Faker::Name.last_name, first_name: Faker::Name.first_name, email: Faker::Internet.email, password: "1234567")
  item.user = user
  item.save
  p "Created skis..."
end
