class PostSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :addressedTo, :created_at, :updated_at

  belongs_to :class_post
  belongs_to :admin

end
