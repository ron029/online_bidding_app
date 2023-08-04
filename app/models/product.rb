# Frozen_string_literal: true

# This class represent the products model of the app.
class Product < ApplicationRecord
  attr_accessor :bid_amount
  before_create :fill_current_lowest_bid

  validates :bid_amount, presence: true
  validate :bid_amount_greater_than_current_lowest

  belongs_to :user
  has_many :bidders

  enum status: { active: 0, sold: 2 }
  validates :lowest_allowable_bid, :starting_bid_price, presence: true, numericality: { greater_than: 0 }
  validates :bidding_expiration, presence: true
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 200 }

  def products_with_dibs
    user = User.first
    product_ids_with_bids = user.bids.pluck(:product_id).uniq
    Product.where(id: product_ids_with_bids)
  end

  def fill_current_lowest_bid
    self.current_lowest_bid = lowest_allowable_bid
  end

  private

  def bid_amount_greater_than_current_lowest
    return unless bid_amount.present? && current_lowest_field.present?
    return unless bid_amount.is_a?(BigDecimal) && current_lowest_field.is_a?(BigDecimal)

    if bid_amount <= current_lowest_field
      errors.add(:bid_amount, "must be greater than the current lowest field")
    end
  end
end
