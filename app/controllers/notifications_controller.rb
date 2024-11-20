# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :set_notification, only: %i[mark_as_read destroy]
  def index
    @notifications = Notification.where(user: Current.user).order(:seen)
  end

  def destroy
    @notification.destroy
    redirect_to user_notifications_path
  end

  def mark_as_read
    @notification.update(seen: true)
    redirect_to user_notifications_path
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end
end
