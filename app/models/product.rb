# Frozen_string_literal: true

# This class represent the products model of the app.
class Product < ApplicationRecord
  before_create :fill_current_lowest_bid

  belongs_to :user
  has_many :bidders

  enum status: { active: 0, sold: 2 }
  validates :lowest_allowable_bid, :starting_bid_price, presence: true, numericality: { greater_than: 0 }
  validates :bidding_expiration, presence: true
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 200 }

  def fill_current_lowest_bid
    self.current_lowest_bid = lowest_allowable_bid
  end
end
