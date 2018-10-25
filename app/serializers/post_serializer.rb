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

class PostSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :addressedTo
  belongs_to :class_post
  belongs_to :admin

end
