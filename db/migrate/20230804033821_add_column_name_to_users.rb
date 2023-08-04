class AddColumnNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :table_name, :column_name, :boolean, default: false
  end
end
