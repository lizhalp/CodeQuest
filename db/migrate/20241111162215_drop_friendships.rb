class DropFriendships < ActiveRecord::Migration[8.0]
  def change
    drop_table :friendships
  end
end
