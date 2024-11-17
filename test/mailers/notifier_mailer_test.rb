require "test_helper"

class NotifierMailerTest < ActionMailer::TestCase
  test "daily_email" do
    email = NotifierMailer.daily_email("cqsamplet@gmail.com")

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ["codequestmailtest@gmail.com"], email.from
    assert_equal ["cqsamplet@gmail.com"], email.to
    assert_equal "CodeQuest Daily Reminder!", email.subject
    assert_match /Hello/, email.body.encoded
  end
end
