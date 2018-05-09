class Experience < ApplicationRecord
	mount_uploader :foto, FotoUploader
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  has_many :blocks, dependent: :destroy
  accepts_nested_attributes_for :blocks, :reject_if => lambda { |a| a[:fecha_salida].blank? }, :allow_destroy => true
  extend FriendlyId
  friendly_id :nombre, use: :slugged

geocoded_by :lugar
after_validation :geocode, if: ->(obj){ obj.lugar.present? and obj.lugar_changed? }
after_validation :lat_changed?

private

# This is used to make sure that our lugar is actually parsed properly and we
# get a valuable lat/long
def lat_changed?
    if (self.lugar_changed?)
        if !(self.latitude_changed?)
            self.errors.add(:lugar, ": La ubicación no es válida")
            return false
        end
    end
    return true
end

end
