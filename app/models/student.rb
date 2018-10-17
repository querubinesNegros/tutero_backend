# == Schema Information
#
# Table name: students
#
#  id         :bigint(8)        not null, primary key
#  age        :integer
#  stratus    :integer
#  pbm        :integer
#  tutor_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ApplicationRecord
  belongs_to :tutor, optional: true
  has_one :user, as: :userable
  has_and_belongs_to_many :schedules
  has_many :tutorings

  validates :age, presence: true, numericality: {only_integer: true,
                                                 greater_than_or_equal_to: 12, less_than_or_equal_to: 80}
  validates :stratus, presence: true, numericality: {only_integer: true,
                                                     greater_than_or_equal_to: 1, less_than_or_equal_to: 6}
  validates :pbm, presence: true, numericality: {only_integer: true,
                                                 greater_than_or_equal_to: 1, less_than_or_equal_to: 100}
  
  default_scope { joins(:user).select('*') }

  def self.pbmStatistics
    group(:pbm).count
  end

  #def self.findNotes(words, id)
  #  joins(:tutorings).where("(tutorings.noteStudent LIKE ? OR tutorings.noteTutor LIKE ?) AND student_id = ?"
  #        , words, words, id)
  #end

  def self.studentsOfTutor(id_t)
    select("name").where(tutor_id: id_t).joins(:user)
  end
  
  def self.getMyTutor(ids) #ids es el id del estudiante
    tutorId =  Student.where(id: ids).first.tutor_id
    Tutor.select("users.id ,email, name, lastname, cellphone").where(id: tutorId ).joins(:user)
  end
  def self.showInfo(ids) #student
    select("users.id, users.userable_id , name, lastname, email, cellphone, pbm, age, stratus ").where(id: ids).joins(:user)
  end
  def self.getTutoringsById(id_userable)
    Tutoring.where(student_id: id_userable)
  end
end
