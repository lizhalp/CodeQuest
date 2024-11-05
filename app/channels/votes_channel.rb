class VotesChannel < ApplicationCable::Channel
  def subscribed
    # Stream from a specific channel for vote updates
    stream_from "votes_for_content_#{params[:content_id]}"
  end

  def unsubscribed
    # Cleanup when channel is unsubscribed
  end
end
