# frozen_string_literal: true

class ConversationsController < ApplicationController
  before_action :set_conversation, only: %i[show]

  def index
    @conversations = Current.user.conversations.includes(:conversation_participants).order(updated_at: :desc)
    @current_conversation = @conversations.first
    @messages = @current_conversation&.messages&.order(:created_at) || []
  end

  def show
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def conversation_params
    params.require(:conversation).permit(:title)
  end
end
