class PostSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :addressedTo
  belongs_to :class_post
  belongs_to :admin

end
