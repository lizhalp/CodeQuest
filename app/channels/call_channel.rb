class CallChannel < ApplicationCable::Channel
  def subscribed
    stream_from "call_channel_user_#{params[:user_id]}"
  end

  def unsubscribed
    # Cleanup when unsubscribed
  end

  # def receive(data)
  #   ActionCable.server.broadcast("call_channel_user_#{params[:user_id]}", data)
  # end
end
