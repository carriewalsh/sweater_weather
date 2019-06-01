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

ActiveRecord::Schema.define(version: 2019_06_01_233840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

end
