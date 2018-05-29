# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_05_29_111454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meal_orders", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "meal_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_meal_orders_on_meal_id"
    t.index ["order_id"], name: "index_meal_orders_on_order_id"
  end

  create_table "meal_reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.integer "speed"
    t.integer "quality"
    t.integer "portion_size"
    t.bigint "meal_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_meal_reviews_on_meal_id"
    t.index ["user_id"], name: "index_meal_reviews_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "ingredients"
    t.bigint "user_id"
    t.integer "portions_left"
    t.string "photo"
    t.string "cuisine"
    t.string "dietary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.time "pick_up_time"
    t.date "pick_up_date"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "meal_orders", "meals"
  add_foreign_key "meal_orders", "orders"
  add_foreign_key "meal_reviews", "meals"
  add_foreign_key "meal_reviews", "users"
  add_foreign_key "meals", "users"
  add_foreign_key "orders", "users"
end
