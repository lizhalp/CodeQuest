# frozen_string_literal: true

class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :sender_id, uniqueness: { scope: :recipient_id }
  validates :recipient_id, uniqueness: { scope: :sender_id }
  validate :acceptance_change

  after_create :notify_recipient
  after_update :notify_sender
  after_update :create_direct_message, if: -> { accepted? }

  def accepted? = accepted == true

  def rejected? = accepted == false

  def sent_by?(user) = sender == user

  def sent_to?(user) = recipient == user

  private

  def notify_recipient
    Notification.create(
      user: recipient, title: "New Friend Request",
      redirect_url: "/users/#{sender.id}",
      message: "#{sender.username} sent you a friend request."
    )
  end

  def notify_sender
    return unless accepted?

    Notification.create(
      user: sender, title: "Friend Request Accepted",
      redirect_url: "/users/#{recipient.id}", message: "#{recipient.username} accepted your friend request."
    )
  end

  def create_direct_message
    Chat::Conversation.create_direct_messages(sender, recipient)
  end

  def acceptance_change
    return unless accepted_changed?

    return if accepted_was.nil? && (accepted? || rejected?)

    errors.add(:accepted, "Accepted can only be changed from nil to true or nil to false.")
  end
end
