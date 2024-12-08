# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ENV['GMAIl_USERNAME']
  layout "mailer"
end
