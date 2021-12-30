# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts '[INFO] Seeding database...'

12.times do
  Resident.create(
    { name: Faker::Name.unique.first_name,
      nric: "S#{Faker::Number.number(digits: 7)}#{('a'..'z').to_a.sample(1).join.upcase}" }
  )
end

3.times do
  Center.create(
    { name: "#{Faker::Address.community} CC" }
  )
end

(Center.first.id..Center.last.id).to_a.each do |c|
  Nurse.create(
    { name: Faker::Name.unique.female_first_name,
      center: Center.find(c) }
  )
end

6.times do
  Nurse.create(
    { name: Faker::Name.unique.female_first_name,
      center: Center.find(rand(Center.first.id..Center.last.id)) }
  )
end

3.times do
  DayOff.create(
    { date: Faker::Date.between(from: '2021-03-01', to: '2021-03-02'),
      nurse: Nurse.find(rand(Nurse.first.id..Nurse.last.id)) }
  )
end

slot_dates = (Date.parse('2021-03-01')...Date.parse('2021-03-02')).to_a
slot_dates.each do |slot_date|
  initial_time = Time.parse("#{slot_date.strftime('%Y-%m-%d')} 08:00 +0800")
  [15, 30, 45].each do |x|
    (Center.first.id..Center.last.id).to_a.each do |c|
      nurses = Center.find(c).nurses
      nurses_count = nurses.count
      nurses.each do |n|
        break if n.day_offs.nil?

        n.day_offs.each do |d|
          nurses_count -= 1 if d.date === slot_date
        end
      end

      Slot.create(
        { date: slot_date,
          start_time: initial_time + x.minutes,
          center: Center.find(c),
          capacity: nurses_count }
      )
    end
  end
end

puts '[SUCCESS] Seeded database'
