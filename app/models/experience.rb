class Experience < ApplicationRecord
	mount_uploader :foto, FotoUploader
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  extend FriendlyId
  friendly_id :nombre, use: :slugged
end
