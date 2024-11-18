class AddFieldsToNotification < ActiveRecord::Migration[8.0]
  def change
    add_column :notifications, :title, :string, default: "Notification"
    add_column :notifications, :redirect_url, :string, default: "/"
  end
end
