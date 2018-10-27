require 'test_helper'

class StudentTutorMailerTest < ActionMailer::TestCase
  test "tutor_assignment" do
    mail = StudentTutorMailer.tutor_assignment
    assert_equal "Tutor assignment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
