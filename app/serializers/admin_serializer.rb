# == Schema Information
#
# Table name: admins
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AdminSerializer < ActiveModel::Serializer
  attributes :id, :user
    
end
