class TutorSerializer < ActiveModel::Serializer
  attributes :id
  has_one :userable
end
