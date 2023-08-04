class AddIsAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_admin, :decimal, precision: 6, scale: 2
  end
end
