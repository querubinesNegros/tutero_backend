class TutoringsMailer < ApplicationMailer

  def recordatorioTutoria(tutoring)
    @tutoring = tutoring
    mail to: @tutoring.student.user.email, subject: 'Recordatorio Tutoria'
  end

end
