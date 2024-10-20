class AddFieldsToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :username, :string
    add_column :users, :notifications_enabled, :boolean, default: true
    add_column :users, :dark_mode_enabled, :boolean, default: false
    add_column :users, :is_admin, :boolean, default: false
  end
end
