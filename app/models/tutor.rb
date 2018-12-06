# == Schema Information
#
# Table name: tutors
#
#  id              :bigint(8)        not null, primary key
#  ammountStudents :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#"
          

class Tutor < ApplicationRecord
  has_one :user, as: :userable
  has_many :students
  has_and_belongs_to_many :schedules
  has_many :tutorings
  # validates :ammountStudents: presence: true, numericality: { only_integer: true }

  #default_scope { joins(:user) }

  def self.horarios(id)
    joins(:schedules).where("tutor_id = ?", id).pluck("schedules.name", :hour)
  end

  def self.tutorings(id)
    joins(students: :user, tutorings: :topic).where("students.tutor_id = ?", id)
      .select("tutorings.*, users.name, users.lastname, topics.name")
  end

  def self.totalHoursTutorings(id)
    joins(:tutorings).where("tutor_id = ? AND date > ?", id, DateTime.now - 30).sum("duration")
  end

  def self.promScoreTutorings(id)
    joins(:tutorings).where("tutor_id = ?", id).average("score").to_f.round(2)
  end

  def self.getTutorings(userable_id)
    #Tutoring.where(tutor: userable_id)
    #Student.joins(:tutorings, :user).where(tutor_id: userable_id)
    Tutoring.where("tutor_id = ?" ,userable_id)
    #Tutoring.select("type_t , duration, date, score, review" ).joins(:student).where("tutor_id = ?" ,userable_id)
    #Tutor.joins(:tutorings, :students, :user).where("students.tutor_id =  ? ",userable_id).select("score , review , name")
  end

  def self.findByCarrer(studentCarrer)
    joins(user: :career).where("careers.name LIKE ?", studentCarrer).select("tutors.*")
  end

  def self.findTutorToStudent(student_id)
    
    tutors = Tutor.ids
    horariosStudent = Student.horarios(student_id)
    tutorsSchedTrue = []

    i=0
    while i < tutors.length do     
      horariosTutor = Tutor.horarios(tutors[i])
      print()
      if ((horariosTutor & horariosStudent) != [] ) then
        tutorsSchedTrue.push (tutors[i])
      end
      i = i + 1
    end
    
    studentCareer = Student.find(student_id).user.career.name

    result = joins(user: :career).where('careers.name = ? AND tutors.id IN (?)  AND "ammountStudents" < ?', 
            studentCareer, tutorsSchedTrue, 5).pluck('tutors.id')
    
    if (result == []) then
      result = joins(user: :career).where('tutors.id IN (?)  AND "ammountStudents" < ?', 
            tutorsSchedTrue, 5).pluck('tutors.id')
    end
    if (result == []) then
      result = joins(user: :career).where('"ammountStudents" < ?', 5).pluck('tutors.id')
    end
    if (result == []) then
      result = tutors[rand(0..tutors.length)]
    else 
      result = result[rand(0..result.length)]
    end
    
    return result
 
  end


end
