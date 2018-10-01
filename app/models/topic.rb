class Topic < ApplicationRecord
    has_many :tutorings

    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 50 }
end
