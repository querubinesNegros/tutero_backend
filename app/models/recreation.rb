class Recreation < ApplicationRecord
    mount_uploader :path, PathUploader
end
