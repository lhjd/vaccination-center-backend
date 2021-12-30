class Nurse < ApplicationRecord
  belongs_to :center
  has_many :day_offs
end
