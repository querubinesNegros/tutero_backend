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
  has_many :tutorings, dependent: :destroy 
  has_many :questions, dependent: :destroy


   #validates :age, presence: true, numericality: {only_integer: true,
   #                                              greater_than_or_equal_to: 12, less_than_or_equal_to: 80}
  #validates :stratus, presence: true, numericality: {only_integer: true,
   #                                                  greater_than_or_equal_to: 1, less_than_or_equal_to: 6}
  #validates :pbm, presence: true, numericality: {only_integer: true,
  #                                               greater_than_or_equal_to: 1, less_than_or_equal_to: 100}

  #default_scope { joins(:user).select("*") }

  def self.pbmStatistics
    queryOutput  = order(:pbm).group(:pbm).count    
    queryOutput.delete(nil)
   
    keysOutput = queryOutput.keys
    hash = {'1-20'=>0,'21-40'=>0,'41-60'=>0,'61-80'=>0,'81-100'=>0,}
    intervalos = hash.keys
    i=0
    j=20
    
    print(queryOutput)
    while i < keysOutput.length do  
           
      if keysOutput[i] <= j
        hash[(j-19).to_s + '-' +  (j).to_s] = hash[(j-19).to_s + '-' +  (j).to_s] + queryOutput [keysOutput[i]]
      else 
        while !(keysOutput[i] <= j)
          j = j+20
          if keysOutput[i] <= j
            hash[(j-19).to_s + '-' +  (j).to_s] = hash[(j-19).to_s + '-' +  (j).to_s] + queryOutput [keysOutput[i]]
          end
        end
      end 
      i=i+1     
    end
    return hash
  end

  def self.stratusStatistics
    order(:stratus).group(:stratus).count
  end

  def self.ageStatistics
    order(:age).group(:age).count
  end  

  #def self.findNotes(words, id)
  #  joins(:tutorings).where("(tutorings.noteStudent LIKE ? OR tutorings.noteTutor LIKE ?) AND student_id = ?"
  #        , words, words, id)
  #end

  def self.studentsOfTutor(id_t)
    where(tutor_id: id_t).joins(:user)
  end

  def self.getMyTutor(ids) #ids es el id del estudiante
    tutorId = Student.where(id: ids).first.tutor_id
    Tutor.select("users.id ,email, name, lastname, cellphone, pict").where(id: tutorId).joins(:user)
  end
  def self.showInfo(ids) #student
    select("users.id, users.userable_id , name, lastname, email, cellphone, pbm, age, stratus ").where(id: ids).joins(:user)
  end
  def self.getTutoringsById(id_userable)
    Tutoring.where(student_id: id_userable)
  end
  def self.horarios(id)
    joins(:schedules).where("student_id = ?", id).pluck("schedules.name", :hour)
  end
end
