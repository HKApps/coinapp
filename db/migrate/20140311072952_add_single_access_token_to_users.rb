require 'authlogic'

class AddSingleAccessTokenToUsers < ActiveRecord::Migration
  def up
    add_column :users, :single_access_token, :string
    add_index :users, :single_access_token

    User.all.each do |u|
      u.single_access_token = Authlogic::Random.friendly_token
      u.save
    end

    change_column :users, :single_access_token, :string, null: false
  end

  def down
    remove_column :users, :single_access_token
  end
end
