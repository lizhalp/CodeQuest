# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_conversation
  before_action :set_conversation_participant

  def index
    @messages = @conversation.messages
  end

  def create
    @message = @conversation.messages.build(message_params)
    @message.user = Current.user

    if @message.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to conversation_path(@conversation) }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@message, partial: "messages/form",
                                                              locals: { message: @message })
        end
        format.html { render "conversations/show" }
      end
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def set_conversation_participant
    @conversation_participant = @conversation.conversation_participants.find_by(user: Current.user)

    redirect_to conversations_path unless @conversation_participant
  end

  def message_params
    params.expect(message: [ :body ])
  end
end
