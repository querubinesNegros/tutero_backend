# == Schema Information
#
# Table name: schedules
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  hour       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :hour, :name
end
