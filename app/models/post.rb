class Post < ApplicationRecord
  belongs_to :class_post
  belongs_to :admin
end
