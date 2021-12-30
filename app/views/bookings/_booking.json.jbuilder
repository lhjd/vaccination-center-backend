# json.extract! booking, :id, :resident_id, :slot_id, :created_at, :updated_at
json.extract! booking, :id, :resident_id, :slot_id
json.resident_name booking.resident.name
json.resident_nric booking.resident.nric
json.center booking.slot.center.name
json.center_id booking.slot.center.id
json.date booking.slot.date
json.time booking.slot.start_time
# json.url booking_url(booking, format: :json)
