require 'test_helper'

class TutorMailerTest < ActionMailer::TestCase
  test "student_assignment" do
    mail = TutorMailer.student_assignment
    assert_equal "Student assignment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
