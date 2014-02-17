class UpdateUsersForAuthlogic < ActiveRecord::Migration
  def change
    remove_column :users, :password
    add_column :users, :crypted_password, :string
    add_column :users, :password_salt, :string
    add_column :users, :persistence_token, :string
  end
end
