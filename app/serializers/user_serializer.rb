class UserSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :lastname, :email, :cellphone, :userable_type 

  belongs_to :career

end
