class TutorSerializer < ActiveModel::Serializer

  attributes :id, :name,  :lastname, :email, :cellphone, :ammountStudents

  has_one :user
  has_many :students
  has_and_belongs_to_many :schedules
  has_many :tutorings

end
