# == Schema Information
#
# Table name: students
#
#  id         :bigint(8)        not null, primary key
#  age        :integer
#  stratus    :integer
#  pbm        :integer
#  tutor_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ApplicationRecord
  belongs_to :tutor, optional: true
  has_one :user, as: :userable
  has_and_belongs_to_many :schedules
  has_many :tutorings

  validates :age, presence: true, numericality: {only_integer: true,
                                                 greater_than_or_equal_to: 12, less_than_or_equal_to: 80}
  validates :stratus, presence: true, numericality: {only_integer: true,
                                                     greater_than_or_equal_to: 1, less_than_or_equal_to: 6}
  validates :pbm, presence: true, numericality: {only_integer: true,
                                                 greater_than_or_equal_to: 1, less_than_or_equal_to: 100}
end
