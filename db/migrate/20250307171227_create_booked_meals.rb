class CreateBookedMeals < ActiveRecord::Migration[8.0]
  def change
    create_table :booked_meals do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
