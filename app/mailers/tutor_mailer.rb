class TutorMailer < ApplicationMailer

  def student_assignment(student)   
    @student = student
    mail to: @student.tutor.user.email, subject: 'Asignacion estudiante'
  end

end
