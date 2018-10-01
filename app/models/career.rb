class Career < ApplicationRecord
    has_many :users

    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 50 }
    
end
