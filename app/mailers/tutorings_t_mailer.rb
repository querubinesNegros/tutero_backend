class TutoringsTMailer < ApplicationMailer

  def recordatorio_tutoria_t(tutoring)
    @tutoring = tutoring
    mail to: @tutoring.student.tutor.user.email, subject: 'Recordatorio Tutoria'    
  end

end
