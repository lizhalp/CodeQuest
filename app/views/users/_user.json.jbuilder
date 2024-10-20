json.extract! user, :id, :email_address, :username, :dark_mode_enabled, :notifications_enabled, :is_admin, :created_at, :updated_at
json.url user_url(user, format: :json)
