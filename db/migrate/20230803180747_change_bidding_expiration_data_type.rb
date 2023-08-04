class ChangeBiddingExpirationDataType < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :bidding_expiration, :datetime
  end
end
