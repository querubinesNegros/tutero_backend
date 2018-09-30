class Admin < ApplicationRecord
    has_one :user, as: :userable
    has_many :posts
end
