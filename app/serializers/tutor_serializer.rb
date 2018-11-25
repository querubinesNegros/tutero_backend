# == Schema Information
#
# Table name: tutors
#
#  id              :bigint(8)        not null, primary key
#  ammountStudents :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class TutorSerializer < ActiveModel::Serializer
  attributes :id, :ammountStudents, :score  
 # has_one :user, as: :userable 
 def score
  Tutor.promScoreTutorings(object.id)
 end
end
