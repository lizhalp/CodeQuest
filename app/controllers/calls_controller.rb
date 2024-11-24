# frozen_string_literal: true

class CallsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    ActionCable.server.broadcast("call_channel_user_#{call_params[:to]}", call_params)
    head :ok
  end

  private

  def call_params
    params.require(:data).permit(:type, :from, :to, :sdp, :candidate)
  end
end
