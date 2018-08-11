class Block < ApplicationRecord
  belongs_to :experience
  has_many :orders, dependent: :destroy
  has_many :packages, dependent: :destroy
end
