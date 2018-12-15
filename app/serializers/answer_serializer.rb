class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :content, :user
  has_one :question
  has_one :user
  def user
    object.user
   end
end
