class User < ApplicationRecord
  belongs_to :career
  belongs_to :userable, polymorphic: true
  has_many :tutorings
  
end

