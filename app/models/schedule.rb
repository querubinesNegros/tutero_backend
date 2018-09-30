class Schedule < ApplicationRecord
    has_and_belongs_to_many :tutors
    has_and_belongs_to_many :students
    has_many :tutorings
end
