class SendDailyEmailsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.logger.info "SendDailyEmailsJob started"
    User.find_each do |user|
      Rails.logger.info "Sending email to #{user.email_address}"
      DailyMailer.daily_email(user.email_address).deliver_later
    end
    Rails.logger.info "SendDailyEmailsJob completed"
  end
end