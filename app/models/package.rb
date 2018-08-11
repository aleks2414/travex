class Package < ApplicationRecord
  belongs_to :user
  belongs_to :block
end
