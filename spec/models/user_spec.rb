# Frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'John Doe', email_address: 'john@example.com', password: 'password')
      expect(user).to be_valid
    end

  #   it 'is not valid without a name' do
  #     user = User.new(email_address: 'john@example.com', password: 'password')
  #     expect(user).not_to be_valid
  #   end

  #   it 'is not valid without an email' do
  #     user = User.new(name: 'John Doe', password: 'password')
  #     expect(user).not_to be_valid
  #   end

  #   it 'is not valid without a password' do
  #     user = User.new(name: 'John Doe', email_address: 'john@example.com')
  #     expect(user).not_to be_valid
  #   end

  #   it 'is not valid without password confirmation' do
  #     user = User.new(name: 'John Doe', email_address: 'john@example.com', password: 'foobar', password_confirmation: '')
  #     expect(user).not_to be_valid
  #   end
  end

  context 'associations', :skip_test do
    it 'has many posts' do
      expect(User.reflect_on_association(:posts).macro).to eq(:has_many)
    end
  end
end
