# frozen_string_literal: true

module Chat
  class ConversationsController < ApplicationController
    before_action :set_conversation, only: %i[show]

    def index
      @conversations = Current.user.chat_conversations.includes(:participants)
      @current_conversation = @conversations.find_by(id: params[:conversation_id]) || @conversations.last
      @messages = @current_conversation&.messages&.order(:created_at) || []
    end

    def show
    end

    private

    def set_conversation
      @conversation = Chat::Conversation.includes(participants: :user).find(params[:id])
    end

    def conversation_params
      params.require(:conversation).permit(:title)
    end
  end
end
