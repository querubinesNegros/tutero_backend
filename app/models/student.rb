class Student < ApplicationRecord
  belongs_to :tutor , optional: true
  has_one :user, as: :userable
  
end
