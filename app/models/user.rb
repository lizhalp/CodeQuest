class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :completions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def completed_content?(content)
    completions.exists?(content:)
  end
end
