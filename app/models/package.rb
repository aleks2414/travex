class Package < ApplicationRecord
  
  belongs_to :block
  has_many :rooms, dependent: :destroy
end
