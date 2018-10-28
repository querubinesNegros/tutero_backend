# Preview all emails at http://localhost:3000/rails/mailers/tutorings_t_mailer
class TutoringsTMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/tutorings_t_mailer/recordatorio_tutoria_t
  def recordatorio_tutoria_t
    TutoringsTMailer.recordatorio_tutoria_t
  end

end
