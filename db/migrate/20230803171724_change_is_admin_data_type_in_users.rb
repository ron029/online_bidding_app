class ChangeIsAdminDataTypeInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :is_admin, :integer, default: 0
  end
end
