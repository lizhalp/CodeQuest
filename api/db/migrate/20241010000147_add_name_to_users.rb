class AddNameToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string
    add_column :users, :notifications_enabled, :boolean, default: true
    add_column :users, :dark_mode_enabled, :boolean, default: true
  end
end
