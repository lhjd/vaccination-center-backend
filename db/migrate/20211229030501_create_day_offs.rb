class CreateDayOffs < ActiveRecord::Migration[7.0]
  def change
    create_table :day_offs do |t|
      t.date :date
      t.references :nurse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
