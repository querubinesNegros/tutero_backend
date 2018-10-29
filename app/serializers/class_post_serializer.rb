# == Schema Information
#
# Table name: class_posts
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ClassPostSerializer < ActiveModel::Serializer
  attributes :id, :name
end
