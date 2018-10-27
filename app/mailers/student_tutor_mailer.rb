class StudentTutorMailer < ApplicationMailer

  def tutor_assignment(student)
    @student = student
    mail to: @student.user.email, subject: 'Asignacion tutor'
  end

end
