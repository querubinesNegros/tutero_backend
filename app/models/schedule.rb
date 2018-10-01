class Schedule < ApplicationRecord
    has_and_belongs_to_many :tutors
    has_and_belongs_to_many :students
    has_many :tutorings

    validates :hour, presence: true, numericality: { only_integer: true, 
    greater_than_or_equal_to: 7, less_than_or_equal_to: 22 }
    validates :name, presence: true, inclusion: { in: %w(lunes martes miercoles jueves viernes sabado),
    message: "%{value} is not a valid day" }
end
