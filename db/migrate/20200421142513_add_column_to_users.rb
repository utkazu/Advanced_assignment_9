class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :postal_code, :integer
    add_column :users, :address, :text
  end
end
