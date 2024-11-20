# frozen_string_literal: true

module Chat
  class ReadReceipt < ApplicationRecord
    belongs_to :message, class_name: "Chat::Message"
    belongs_to :user

    validates :message_id, uniqueness: { scope: :user_id }
    validates :read_at, presence: true
  end
end
