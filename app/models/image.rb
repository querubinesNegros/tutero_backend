# == Schema Information
#
# Table name: images
#
#  id         :bigint(8)        not null, primary key
#  path       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Image < ApplicationRecord
  mount_uploader :path, PathUploader
  has_one :filep, as: :filepable
end
