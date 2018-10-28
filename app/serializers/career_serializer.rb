# == Schema Information
#
# Table name: careers
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CareerSerializer < ActiveModel::Serializer
  attributes :id, :name
end
