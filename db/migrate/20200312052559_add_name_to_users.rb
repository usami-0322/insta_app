class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fullname, :string
    add_column :users, :username, :string
    add_column :users, :url, :string
    add_column :users, :sex, :integer
    add_column :users, :introduce, :text
    add_column :users, :phone, :string
  end
end
