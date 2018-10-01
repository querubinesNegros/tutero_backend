class Pdf < ApplicationRecord
    has_one :filep, as: :filepable
end
