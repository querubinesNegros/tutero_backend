# == Schema Information
#
# Table name: tutorings
#
#  id          :bigint(8)        not null, primary key
#  topic_id    :bigint(8)
#  type_t      :string
#  duration    :integer
#  noteStudent :text
#  noteTutor   :text
#  student_id  :bigint(8)
#  date        :date
#  score       :integer
#  review      :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tutor_id    :bigint(8)
#  hour        :string
#

class TutoringSerializer < ActiveModel::Serializer
  
  attributes :id, :type_t, :date, :duration, :noteStudent, :noteTutor, :score, :review, :tutor_id , :hour

  belongs_to :topic
  belongs_to :student


end
