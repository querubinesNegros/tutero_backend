# == Schema Information
#
# Table name: tutors
#
#  id              :bigint(8)        not null, primary key
#  ammountStudents :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Tutor < ApplicationRecord
  has_one :user, as: :userable
  has_many :students
  has_and_belongs_to_many :schedules
  has_many :tutorings, through: :students
  # validates :ammountStudents: presence: true, numericality: { only_integer: true }

end
