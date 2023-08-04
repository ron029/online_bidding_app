class RemoveColumnNameFromTableNam < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :is_an_admin_new, :string, default: 0
  end
end
