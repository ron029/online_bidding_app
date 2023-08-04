class RemoveColumnNameFromTableName < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :is_an_admin_new, :integer
  end
end
