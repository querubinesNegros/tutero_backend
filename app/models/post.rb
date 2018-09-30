class Post < ApplicationRecord
  belongs_to :class_post
  belongs_to :admin
  has_many :fileps
end
