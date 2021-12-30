class Booking < ApplicationRecord
  belongs_to :resident
  belongs_to :slot
  validates :resident, uniqueness: { message: 'already has a booking' }
  # validates :slot, uniqueness: { message: 'has already been booked' }

  validate :slot_capacity_cannot_be_exceeded, on: %i[create update]

  def slot_capacity_cannot_be_exceeded
    errors.add(:slot, 'is full') if slot.bookings.count >= slot.capacity
  end
end
