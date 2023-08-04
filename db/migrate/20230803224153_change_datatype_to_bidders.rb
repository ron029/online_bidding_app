class ChangeDatatypeToBidders < ActiveRecord::Migration[6.0]
  def change
    change_column :bidders, :bid_amount, :decimal, precision: 10, scale: 2
  end
end
