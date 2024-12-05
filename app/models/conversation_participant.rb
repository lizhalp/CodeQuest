# frozen_string_literal: true

class ConversationParticipant < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates :conversation_id, uniqueness: { scope: :user_id }
end
