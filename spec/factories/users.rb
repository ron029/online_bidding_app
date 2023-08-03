# Frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email_address { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
