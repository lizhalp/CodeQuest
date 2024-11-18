# frozen_string_literal: true

module Chat
  class Message < ApplicationRecord
    belongs_to :conversation, class_name: "Chat::Conversation"
    belongs_to :user

    has_rich_text :body

    validates :body, presence: true, length: { maximum: 10_000 }
    validate :user_must_be_participant

    after_create_commit do
      broadcast_append_to "conversation_#{conversation.id}", partial: "chat/messages/message", locals: { message: self }
    end

    private

    def user_must_be_participant
      return if conversation.participants.exists?(user:)

      errors.add(:base, "You must be a participant of the conversation")
    end
  end
end
