class Post < ApplicationRecord
  belongs_to :class_post
  belongs_to :admin
  has_many :fileps

  validates :class_post_id, :admin_id, :name, :description, presence: true

end
