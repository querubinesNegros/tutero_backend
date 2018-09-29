class Tutor < ApplicationRecord
    has_one :user, as: :userable
    has_many :students
end
