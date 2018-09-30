class Student < ApplicationRecord
  belongs_to :tutor , optional: true
  has_one :user, as: :userable
  has_and_belongs_to_many :schedules
  has_many :tutorings
end
