class Center < ApplicationRecord
  has_many :nurses
  has_many :slots
end
