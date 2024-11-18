# frozen_string_literal: true

module Chat
  class ConversationParticipant < ApplicationRecord
    belongs_to :conversation, class_name: "Chat::Conversation"
    belongs_to :user

    validates :conversation_id, uniqueness: { scope: :user_id }
  end
end
