# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "creating fake users"
20.times do |i|
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    password: 123123
    )
  user.save!
end
puts "done"

puts "creating fake sellers"
20.times do |i|
  seller = Seller.new(
    user_id: i + 1,
    name: Faker::Company.name,
    address: Faker::Address.full_address
    )
  seller.save!
end
puts "done"

puts "creating fake products"
40.times do |i|
  product = Product.new(
    description: Faker::Commerce.product_name,
    category: Faker::Commerce.department(max: 1)
    )
  product.save!
end
puts "done"

puts "creating auctions"
30.times do |i|
  auction = Auction.new(
    user_id: rand(1..20),
    deadline: DateTime.now,
    status: 'open'
    )
  auction.save!
end
puts "done"

puts "creating auction products"
90.times do |i|
  auction_product = AuctionProduct.new(
    auction_id: rand(1..30),
    product_id: rand(1..40),
    quantity: rand(1..100)
    )
  auction_product.save!
end
puts "done"


puts "creating bids"
60.times do |i|
  bid = Bid.new(
    auction_id: rand(1..30),
    seller_id: rand(1..20),
    total: rand(1.0..500.0),
    status: 'normal'
    )
  bid.save!
end
puts "done"
