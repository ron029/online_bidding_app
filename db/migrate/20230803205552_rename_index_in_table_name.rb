class RenameIndexInTableName < ActiveRecord::Migration[6.0]
  def change
    rename_column :bidders, 'users_id', 'user_id'
    rename_column :bidders, 'products_id', 'product_id'
  end
end
