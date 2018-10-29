require 'test_helper'

class TutoringsTMailerTest < ActionMailer::TestCase
  test "recordatorio_tutoria_t" do
    mail = TutoringsTMailer.recordatorio_tutoria_t
    assert_equal "Recordatorio tutoria t", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
