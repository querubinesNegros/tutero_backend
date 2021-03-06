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

class Tutoring < ApplicationRecord
  belongs_to :topic
  belongs_to :student
  belongs_to :tutor

  #validates :score, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
  #validates :duration, presence: true, numericality: true
  validates :topic_id, presence: true
  validates :student_id, presence: true
  
 
  #default_scope { joins(:topicraiks) }

  def self.topicStatistics
    joins(:topic).select("topics.name").group("topics.name").order('count_topics_name').count
  end
  
  
end
