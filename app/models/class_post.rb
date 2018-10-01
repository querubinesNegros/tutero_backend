class ClassPost < ApplicationRecord
    has_many :posts

    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 50 }
    
end
