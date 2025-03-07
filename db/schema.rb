# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_07_171227) do
  create_table "booked_meals", force: :cascade do |t|
    t.integer "meal_id", null: false
    t.integer "food_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_booked_meals_on_food_id"
    t.index ["meal_id"], name: "index_booked_meals_on_meal_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "title"
    t.text "desc"
    t.integer "calorie"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "date"
    t.time "time"
    t.decimal "total_price"
    t.integer "total_calories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "calorie_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "booked_meals", "foods"
  add_foreign_key "booked_meals", "meals"
  add_foreign_key "meals", "users"
end
