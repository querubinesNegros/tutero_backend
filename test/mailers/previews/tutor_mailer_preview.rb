# Preview all emails at http://localhost:3000/rails/mailers/tutor_mailer
class TutorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/tutor_mailer/student_assignment
  def student_assignment
    TutorMailer.student_assignment
  end

end
