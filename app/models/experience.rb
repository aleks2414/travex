class Experience < ApplicationRecord
	mount_uploader :foto, FotoUploader
  belongs_to :user
  extend FriendlyId
  friendly_id :nombre, use: :slugged
end
