require 'test_helper'

class NoticeMailerTest < ActionMailer::TestCase
  test "sendmail_instagram" do
    mail = NoticeMailer.sendmail_instagram
    assert_equal "Sendmail instagram", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
