# == Schema Information
#
# Table name: images
#
#  id         :bigint(8)        not null, primary key
#  path       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ImageSerializer < ActiveModel::Serializer
  attributes :id, :path
end
