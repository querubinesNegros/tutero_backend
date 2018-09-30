class Tutor < ApplicationRecord
    has_one :user, as: :userable
    has_many :students
    has_and_belongs_to_many :schedules
    
end
