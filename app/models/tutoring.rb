class Tutoring < ApplicationRecord
  belongs_to :topic
  belongs_to :schedule
  belongs_to :student

  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :duration, presence: true, numericality: true
  #validates :topic_id, presence: true
  #validates :schedule_id, presence: true
  #validates :student_id, presence: true

end
