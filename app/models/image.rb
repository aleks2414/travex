class Image < ApplicationRecord
  belongs_to :experience
  mount_uploader :image2, ImageUploader
end
