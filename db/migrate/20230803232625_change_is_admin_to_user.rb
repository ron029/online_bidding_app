class ChangeIsAdminToUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :is_admin, :is_an_admin_new
  end
end
