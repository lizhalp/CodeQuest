class TestEmailController < ApplicationController
    def send_daily_email
      DailyMailer.daily_email(ENV['GMAIl_USERNAME']).deliver_now
      render plain: 'Daily email sent!'
    end
  end