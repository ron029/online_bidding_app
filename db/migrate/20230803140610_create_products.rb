class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :status, default: 0
      t.decimal :lowest_allowable_bid, precision: 6, scale: 2
      t.decimal :starting_bid_price, precision: 6, scale: 2
      t.datetime :bidding_expiration, precision: 6, scale: 2

      t.timestamps
    end
  end
end
