# frozen_string_literal: true

class CallsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    recipient_id = params[:user_id]
    ActionCable.server.broadcast("call_channel_user_#{recipient_id}", call_params)
    head :ok
  end

  private

  def call_params
    params.require(:data).permit(:type, :from, :sdp, :candidate)
  end
end
