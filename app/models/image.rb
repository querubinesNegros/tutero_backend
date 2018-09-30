class Image < ApplicationRecord
    has_one :filep, as: :filepable
end
