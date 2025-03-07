class CreateMeals < ActiveRecord::Migration[8.0]
  def change
    create_table :meals do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.time :time
      t.decimal :total_price
      t.integer :total_calories

      t.timestamps
    end
  end
end
