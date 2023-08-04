class AddColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :current_lowest_bid, :decimal, precision: 10, scale: 2
  end
end
