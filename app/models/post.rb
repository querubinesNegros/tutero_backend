# == Schema Information
#
# Table name: posts
#
#  id            :bigint(8)        not null, primary key
#  class_post_id :bigint(8)
#  admin_id      :bigint(8)
#  name          :string
#  description   :text
#  addressedTo   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :class_post
  belongs_to :admin
  has_many :fileps

  validates :class_post_id, :admin_id, :name, :description, presence: true
end
