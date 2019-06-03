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

ActiveRecord::Schema.define(version: 2019_06_03_175139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "antipodes", force: :cascade do |t|
    t.bigint "city_id"
    t.string "search_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_current_id"
    t.index ["city_current_id"], name: "index_antipodes_on_city_current_id"
    t.index ["city_id"], name: "index_antipodes_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "latitude"
    t.string "longitude"
    t.string "country"
  end

  create_table "city_currents", force: :cascade do |t|
    t.decimal "temp"
    t.decimal "apparent"
    t.string "icon"
    t.decimal "cloud_cover"
    t.decimal "humidity"
    t.decimal "visibility"
    t.decimal "uv_index"
    t.decimal "wind_speed"
    t.decimal "wind_direction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.string "summary"
    t.index ["city_id"], name: "index_city_currents_on_city_id"
  end

  create_table "city_days", force: :cascade do |t|
    t.bigint "city_id"
    t.bigint "day_id"
    t.decimal "high"
    t.decimal "low"
    t.string "icon"
    t.decimal "precip_probability"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_city_days_on_city_id"
    t.index ["day_id"], name: "index_city_days_on_day_id"
  end

  create_table "city_steadies", force: :cascade do |t|
    t.bigint "city_id"
    t.bigint "day_id"
    t.decimal "moon_phase"
    t.string "phase_description"
    t.string "phase_icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sunrise"
    t.string "sunset"
    t.index ["city_id"], name: "index_city_steadies_on_city_id"
    t.index ["day_id"], name: "index_city_steadies_on_day_id"
  end

  create_table "days", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "city_id"
    t.string "owner"
    t.string "secret"
    t.string "server"
    t.string "title"
    t.index ["city_id"], name: "index_photos_on_city_id"
  end

  create_table "user_cities", force: :cascade do |t|
    t.bigint "city_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_user_cities_on_city_id"
    t.index ["user_id"], name: "index_user_cities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "api_key"
  end

  add_foreign_key "antipodes", "cities"
  add_foreign_key "city_days", "cities"
  add_foreign_key "city_days", "days"
  add_foreign_key "city_steadies", "cities"
  add_foreign_key "city_steadies", "days"
  add_foreign_key "photos", "cities"
  add_foreign_key "user_cities", "cities"
  add_foreign_key "user_cities", "users"
end
