class CreateFoods < ActiveRecord::Migration[8.0]
  def change
    create_table :foods do |t|
      t.string :title
      t.text :desc
      t.integer :calorie
      t.integer :price

      t.timestamps
    end
  end
end
