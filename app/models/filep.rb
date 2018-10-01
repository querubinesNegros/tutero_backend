class Filep < ApplicationRecord
  belongs_to :filepable, polymorphic: true
  belongs_to :post
end
