class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :title, :string
  end
end
