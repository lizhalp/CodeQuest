# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :sent_friend_requests, class_name: "FriendRequest", foreign_key: "sender_id", dependent: :destroy
  has_many :received_friend_requests, class_name: "FriendRequest", foreign_key: "recipient_id", dependent: :destroy

  has_many :sent_friends, lambda {
    where(friend_requests: { accepted: true })
  }, through: :sent_friend_requests, source: :recipient
  has_many :received_friends, lambda {
    where(friend_requests: { accepted: true })
  }, through: :received_friend_requests, source: :sender

  has_many :chat_conversation_participants, class_name: "Chat::ConversationParticipant", dependent: :destroy
  has_many :chat_conversations, through: :chat_conversation_participants, source: :conversation

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  attribute :image_url, :string, default: "https://www.gravatar.com/avatar/00000000000000000000000000000000"

  def friends
    User.where(id: sent_friends.ids + received_friends.ids)
  end

  def last_seen_at
    sessions.order(:updated_at).last&.updated_at || Time.current
  end

  def online?
  end

  def self.from_omniauth(response)
    User.find_or_create_by(uid: response["uid"], provider: response["provider"]) do |u|
      u.email_address = response["info"]["email"]
      u.username = response["info"]["name"]
      u.image_url = response["info"]["image"]
      u.password = SecureRandom.hex(16)
    end
  end
end
