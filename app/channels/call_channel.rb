class CallChannel < ApplicationCable::Channel
  def subscribed
    stream_from "call_channel_user_#{params[:user_id]}"
  end

  def unsubscribed
    # Cleanup when unsubscribed
  end

  def receive(data)
    # The `data` hash should include the `to` (recipient) and `from` (sender) fields.
    # Ensure that the data contains the necessary information.
    if User.find(data[:to]) && User.find(data[:from])
      # Get the recipient's user ID from the `data[:to]` field
      target_user_id = data[:to]

      # Broadcast the data to the correct user
      # This will send the signaling data to the peer (the intended recipient)
      ActionCable.server.broadcast("call_channel_user_#{target_user_id}", data)
    else
      logger.error "Invalid signaling data: missing 'to' or 'from' field"
    end
  end
end
