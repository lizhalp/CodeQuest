# frozen_string_literal: true

class ReadReceipt < ApplicationRecord
  belongs_to :message
  belongs_to :user

  validates :message_id, uniqueness: { scope: :user_id }
  validates :read_at, presence: true
end
