class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at
  has_one :student
  has_one :topic
  has_many :answers
end
