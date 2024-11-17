class NotifierMailerPreview < ActionMailer::Preview
    def daily_email
      NotifierMailer.daily_email("cqsamplet@gmail.com")
    end
  end
  