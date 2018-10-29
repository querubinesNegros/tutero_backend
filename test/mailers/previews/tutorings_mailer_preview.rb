# Preview all emails at http://localhost:3000/rails/mailers/tutorings_mailer
class TutoringsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/tutorings_mailer/recordatorioTutoria
  def recordatorioTutoria
    TutoringsMailer.recordatorioTutoria
  end

end
