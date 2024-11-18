# frozen_string_literal: true

module Chat
  class Conversation < ApplicationRecord
    has_many :participants, class_name: "Chat::ConversationParticipant", dependent: :destroy
    has_many :participants_users, through: :participants, source: :user

    has_many :messages, class_name: "Chat::Message", dependent: :destroy

    validates :title, presence: true, if: -> { !is_direct_message }
    validates :participants, length: { is: 2 }, if: -> { is_direct_message }
    validates :participants, length: { minimum: 3 }, if: -> { !is_direct_message }
    validate :must_have_participant_friends, if: -> { is_direct_message }

    def self.create_direct_messages(user1, user2)
      conversation = new(title: "Direct message", is_direct_message: true)
      conversation.participants.build(user: user1)
      conversation.participants.build(user: user2)
      conversation.save
    end

    private

    def must_have_participant_friends
      return if participants.length != 2
      return if participants.first.user.friends.include?(participants.second.user)

      errors.add(:base, "A direct message conversation must be between friends")
    end
  end
end
