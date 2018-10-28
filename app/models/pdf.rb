# == Schema Information
#
# Table name: pdfs
#
#  id         :bigint(8)        not null, primary key
#  path       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pdf < ApplicationRecord
  mount_uploader :path, PathUploader
  has_one :filep, as: :filepable
end
