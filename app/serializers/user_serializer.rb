class UserSerializer < ActiveModel::Serializer
  type 'profile'
  attributes :id, :name, :lastname, :email, :cellphone, :userable_type, :userable_id
  #belongs_to :career
end
