class MailsSenderJob < ApplicationJob
  queue_as :default

  def perform(tutoring_id)
    @tutoring = Tutoring.find(tutoring_id)
    TutoringsMailer.recordatorioTutoria(@tutoring).deliver_now
    TutoringsTMailer.recordatorio_tutoria_t(@tutoring).deliver_now
  end
  
end
