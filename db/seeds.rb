# Frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create(name: 'Administrator', email_address: "admin@admin.com", password: "foobar", password_confirmation: "foobar", is_an_admin_new: 1)
# User.create(name: 'Ron Mark', email_address: 'bonifacioronmark@gmail.com', password: 'foobar', password_confirmation: 'foobar')

100.times do
  Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    status: Product.statuses.keys.sample,
    lowest_allowable_bid: Faker::Commerce.price(range: 1..100.0),
    starting_bid_price: Faker::Commerce.price(range: 100.0..1000.0),
    bidding_expiration: Faker::Time.between(from: DateTime.now, to: 1.year.from_now)
  )
end
