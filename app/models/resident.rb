class Resident < ApplicationRecord
  has_one :booking

  validates :nric, uniqueness: true
end
