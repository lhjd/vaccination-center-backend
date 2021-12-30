class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.date :date
      t.time :start_time
      t.references :center, null: false, foreign_key: true
      t.integer :capacity

      t.timestamps
    end
  end
end
