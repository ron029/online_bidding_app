FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    status { "MyString" }
    lowest_allowable_bid { "9.99" }
    starting_bid_price { "9.99" }
    bidding_expiration { "2023-08-03 22:06:10" }
  end

  # factory :product do
  #   100.times do
  #     name { Faker::Commerce.product_name }
  #     description { Faker::Lorem.paragraph }
  #     status { Product.statuses.keys.sample }
  #     lowest_allowable_bid { Faker::Commerce.price(range: 1..100.0) }
  #     starting_bid_price { Faker::Commerce.price(range: 100.0..1000.0) }
  #     bidding_expiration { Faker::Time.between(from: DateTime.now, to: 1.year.from_now) }
  #   end
  # end
end
