# Frozen_string_literal: true

# This class represent the bidder model of the app.
class Bidder < ApplicationRecord
  before_save :update_product_current_lowest_bid

  belongs_to :user
  belongs_to :product

  # validates :user_id, presence: true
  # validates :product_id, presence: true
  # validates :bid_amount, presence: true

  def update_product_current_lowest_bid
    product = Product.find(product_id)
    product.update_attribute('current_lowest_bid', bid_amount)
  end
end
