class FilepSerializer < ActiveModel::Serializer

  attributes :id, :name, :created_at, :updated_at
  belongs_to :post
end
