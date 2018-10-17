# == Schema Information
#
# Table name: tutorings
#
#  id          :bigint(8)        not null, primary key
#  topic_id    :bigint(8)
#  type_t      :string
#  schedule_id :bigint(8)
#  duration    :integer
#  noteStudent :text
#  noteTutor   :text
#  student_id  :bigint(8)
#  date        :date
#  score       :integer
#  review      :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tutoring < ApplicationRecord
  belongs_to :topic
  belongs_to :schedule
  belongs_to :student

  validates :score, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
  validates :duration, presence: true, numericality: true
  validates :topic_id, presence: true
  validates :schedule_id, presence: true
  validates :student_id, presence: true

  default_scope { joins(:topic).select('*') }  

  def self.topicStatistics
    group(:topic).count
  end

end
