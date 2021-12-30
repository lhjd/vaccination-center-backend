class CreateNurses < ActiveRecord::Migration[7.0]
  def change
    create_table :nurses do |t|
      t.string :name
      t.references :center, null: false, foreign_key: true

      t.timestamps
    end
  end
end
