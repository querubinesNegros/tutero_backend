class StudentSerializer < ActiveModel::Serializer
  attributes :id, :age, :stratus, :pbm

  belongs_to :tutor
  has_one :user
  has_and_belongs_to_many :schedules
  has_many :tutorings

end
