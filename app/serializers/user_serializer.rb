class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :lastname, :cellphone, :career_id, :userable_type, :userable_id 

end
