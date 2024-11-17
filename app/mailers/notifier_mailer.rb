class NotifierMailer < ApplicationMailer
    def daily_email(email)
        Rails.logger.debug "Email received: #{email.inspect} (#{email.class})"
        mail(
        to: email, 
        subject: "CodeQuest Daily Reminder!"
        )
    end
  end
  