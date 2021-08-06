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

ActiveRecord::Schema.define(version: 2019_09_12_111818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attractions", force: :cascade do |t|
    t.string "image"
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_attractions_on_user_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "price_night"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_hotels_on_user_id"
  end

  create_table "safari_attractions", force: :cascade do |t|
    t.bigint "safari_id"
    t.bigint "attraction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_safari_attractions_on_attraction_id"
    t.index ["safari_id"], name: "index_safari_attractions_on_safari_id"
  end

  create_table "safari_hotels", force: :cascade do |t|
    t.bigint "safari_id"
    t.bigint "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_safari_hotels_on_hotel_id"
    t.index ["safari_id"], name: "index_safari_hotels_on_safari_id"
  end

  create_table "safaris", force: :cascade do |t|
    t.string "banner_image"
    t.string "title"
    t.string "description"
    t.string "itinerary_description"
    t.string "price"
    t.string "hotels_description"
    t.string "includes_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "expect"
    t.index ["user_id"], name: "index_safaris_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "safari_id"
    t.index ["safari_id"], name: "index_schedules_on_safari_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attractions", "users"
  add_foreign_key "hotels", "users"
  add_foreign_key "safari_attractions", "attractions"
  add_foreign_key "safari_attractions", "safaris"
  add_foreign_key "safari_hotels", "hotels"
  add_foreign_key "safari_hotels", "safaris"
  add_foreign_key "safaris", "users"
  add_foreign_key "schedules", "safaris"
end
