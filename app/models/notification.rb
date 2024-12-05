# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :user

  validates :message, presence: true

  attribute :seen, :boolean, default: false
  attribute :title, :string, default: "New Notification"

  scope :unread, -> { where(seen: false) }
end
