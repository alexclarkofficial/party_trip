# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150426085059) do

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "trip_id"
  end

  add_index "locations", ["trip_id"], name: "index_locations_on_trip_id"

  create_table "ratings", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "vote"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ratings", ["location_id"], name: "index_ratings_on_location_id"

  create_table "trips", force: :cascade do |t|
    t.datetime "start_date"
    t.integer  "duration"
    t.integer  "max_cost"
    t.integer  "min_cost"
    t.boolean  "voting_active?"
    t.string   "departure_airport"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.date     "end_date"
  end

end
