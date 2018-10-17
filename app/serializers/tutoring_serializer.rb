class TutoringSerializer < ActiveModel::Serializer
  
  attributes :id, :type_t, :date, :duration, :noteStudent, :noteTutor, :score, :review

  belongs_to :topic
  belongs_to :schedule
  belongs_to :student

end
