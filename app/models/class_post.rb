# == Schema Information
#
# Table name: class_posts
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ClassPost < ApplicationRecord
  has_many :posts

  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 5, maximum: 50}
end
