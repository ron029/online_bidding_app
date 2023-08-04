class ChangeDatatypeToProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :lowest_allowable_bid, :decimal, precision: 10, scale: 2
    change_column :products, :starting_bid_price, :decimal, precision: 10, scale: 2
  end
end
