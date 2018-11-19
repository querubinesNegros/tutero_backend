class MailsSender2Job < ApplicationJob
  queue_as :default

  def perform(student_id)
    @student = Student.find(student_id)
    StudentTutorMailer.tutor_assignment(@student).deliver_now
    TutorMailer.student_assignment(@student).deliver_now 
  end
end
