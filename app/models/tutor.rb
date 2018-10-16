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

  default_scope { joins(:user) }
  
  def self.horarios(id)
    joins(:schedules).where("tutor_id = ?", id).pluck(:name, :hour)
  end

  def self.tutorings(id)
    joins(:tutorings).where("tutor_id = ?", id)
  end

  def self.totalHoursTutorings(id, dateAfter)
    joins(:tutorings).where("tutor_id = ? AND date > ?", id, dateAfter).sum("duration")
  end
  
  def self.getTutorings(userable_id)
    Student.where(tutor_id: userable_id)
  end
  #def self.findTutorToStudent(day, hour, studentCarrer)
  #  joins(:schedules).where("schedule.name = ? AND ", day).pluck(:name, :hour)
  #end

end

