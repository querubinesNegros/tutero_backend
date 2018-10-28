# == Schema Information
#
# Table name: tutors
#
#  id              :bigint(8)        not null, primary key
#  ammountStudents :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Tutor < ApplicationRecord
  has_one :user, as: :userable
  has_many :students
  has_and_belongs_to_many :schedules
  has_many :tutorings, through: :students
  # validates :ammountStudents: presence: true, numericality: { only_integer: true }

  #default_scope { joins(:user) }

  def self.horarios(id)
    joins(:schedules).where("tutor_id = ?", id).pluck("schedules.name", :hour)
  end

  def self.tutorings(id)
    joins(students: :user, tutorings: :topic).where("students.tutor_id = ?", id)
      .select("tutorings.*, users.name, users.lastname, topics.name")
  end

  def self.totalHoursTutorings(id, dateAfter)
    joins(:tutorings).where("tutor_id = ? AND date > ?", id, dateAfter).sum("duration")
  end

  def self.getTutorings(userable_id)
    Student.joins(:tutorings, :user).where(tutor_id: userable_id).select("tutorings.id ,score , name, lastname , review, duration, date , schedule_id , topic_id")
    #Tutoring.select("type_t , duration, date, score, review" ).joins(:student).where("tutor_id = ?" ,userable_id)
    #Tutor.joins(:tutorings, :students, :user).where("students.tutor_id =  ? ",userable_id).select("score , review , name")
  end
  def self.findByCarrer(studentCarrer)
    joins(user: :career).where("careers.name LIKE ?", studentCarrer).select("tutors.*")
  end

  #def self.findTutorToStudent(day, hour, studentCarrer)
  #  joins(:careers, :schedules).where("schedule.name = ? AND schedule.hour = ? AND career.name = ?",
  #    day, hour, studentCarrer).select('tutors.*')
  #end

end
