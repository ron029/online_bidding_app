class CreateBidders < ActiveRecord::Migration[6.0]
  def change
    create_table :bidders do |t|
      t.references :users, null: false, foreign_key: true
      t.references :products, null: false, foreign_key: true
      t.decimal :bid_amount, precision: 6, scale: 2
      t.timestamps
    end
  end
end
