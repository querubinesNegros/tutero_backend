
# == Schema Information
#
# Table name: careers
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Career < ApplicationRecord
  has_many :users

  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 5, maximum: 50}
end
