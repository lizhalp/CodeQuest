class DailyMailer < ApplicationMailer
  default from: "codequestemailtest@gmail.com"

  def daily_email(email)
    email = email.downcase
    Rails.logger.debug "Processing daily email for: #{email.inspect} (#{email.class})"

    @user = User.find_by(email_address: email)

    if @user.nil?
      Rails.logger.debug "User not found for email: #{email.inspect}"
      return
    end
    mail(
      to: email,
      subject: "CodeQuest Daily Reminder"
    )
  end
end