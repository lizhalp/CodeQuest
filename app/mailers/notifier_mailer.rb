class NotifierMailer < ApplicationMailer
    def daily_email(user)

        mail(
            to: user.email_address, 
            subject: "CodeQuest Daily Reminder!",
        )
end
