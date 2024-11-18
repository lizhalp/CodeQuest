class NotifierMailer < ApplicationMailer

    default from: "codequestmailtest@gmail.com"

    def welcome_email
        @user = params[:user]
        @url  = "http://example.com/login"
        mail(to: @user.email, subject: "Welcome to My Awesome Site")
    end

    def daily_email(email)
        email = email.downcase
        Rails.logger.debug "Processing daily email for: #{email.inspect} (#{email.class})"
        @user = User.find_by(email_address: email)

        if @user.nil?
            Rails.logger.error "User not found for email: #{email}"
            return
        end
        mail(
            to: @user.email_address, 
            subject: "CodeQuest Daily Reminder!"
        )
    end
    
  end
  