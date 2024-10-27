class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :completions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def completed_content?(content)
    completions.exists?(content:)
  end

  def self.from_omniauth(response)
    User.find_or_create_by(uid: response["uid"], provider: response["provider"]) do |u|
      u.email_address = response["info"]["email"]
      u.username = response["info"]["name"]
      u.password = SecureRandom.hex(16)
    end
  end
end
