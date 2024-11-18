# frozen_string_literal: true

module Chat
  class ReadReceiptsController < ApplicationController
    def create
      message = Message.find(params[:message_id])
      receipt = message.read_receipts.find_or_initialize_by(user: Current.user)
      receipt.read_at = Time.zone.now
      receipt.save!

      head :created
    end
  end
end
