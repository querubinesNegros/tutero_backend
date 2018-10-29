require 'test_helper'

class TutoringsMailerTest < ActionMailer::TestCase
  test "recordatorioTutoria" do
    mail = TutoringsMailer.recordatorioTutoria
    assert_equal "Recordatoriotutoria", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
