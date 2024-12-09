# frozen_string_literal: true

class Conversation < ApplicationRecord
  has_many :conversation_participants, dependent: :destroy

  has_many :messages, dependent: :destroy

  validates :title, presence: true, if: -> { !is_direct_message }

  def participants
    conversation_participants.includes(:user).map(&:user)
  end

  def direct_message_recipient(current_user)
    participants.reject { |participant| participant == current_user }.first
  end

  def self.create_direct_messages(user1, user2)
    conversation = new(title: "Direct message", is_direct_message: true)
    if conversation.save
      Conversation.transaction do
        conversation.conversation_participants.create(user: user1)
        conversation.conversation_participants.create(user: user2)
      end
    else
      puts conversation.errors.full_messages
    end
  end
end
