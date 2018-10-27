# Preview all emails at http://localhost:3000/rails/mailers/student_tutor_mailer
class StudentTutorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/student_tutor_mailer/tutor_assignment
  def tutor_assignment
    StudentTutorMailer.tutor_assignment
  end

end
