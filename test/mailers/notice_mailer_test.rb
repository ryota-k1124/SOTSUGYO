require 'test_helper'

class NoticeMailerTest < ActionMailer::TestCase
  test "sendmail_menu" do
    mail = NoticeMailer.sendmail_menu
    assert_equal "Sendmail menu", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
