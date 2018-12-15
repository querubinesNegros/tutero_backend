# == Schema Information
#
# Table name: topics
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ApplicationRecord
  has_many :tutorings
  has_many :questions

  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 5, maximum: 50}
end
