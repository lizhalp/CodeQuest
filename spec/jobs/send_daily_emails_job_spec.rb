# app/jobs/send_daily_emails_job.rb
class SendDailyEmailsJob < ApplicationJob
  queue_as :default

  def perform
    User.find_each do |user|
      UserMailer.daily_email(user.email_address).deliver_later
    end
  end
end
