# frozen_string_literal: true

class Conversation < ApplicationRecord
  has_many :conversation_participants, dependent: :destroy


  has_many :messages, dependent: :destroy

  validates :title, presence: true, if: -> { !is_direct_message }
  validates :participants, length: { is: 2 }, if: -> { is_direct_message }
  validates :participants, length: { minimum: 3 }, if: -> { !is_direct_message }
  validate :must_have_participant_friends, if: -> { is_direct_message }

  def participants
    conversation_participants.includes(:user).map(&:user)
  end

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
