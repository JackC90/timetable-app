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

ActiveRecord::Schema.define(version: 20170211092440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "slots", force: :cascade do |t|
    t.string   "day"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_slots_on_subject_id", using: :btree
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.integer  "credits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_tables", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "complete",   default: false
  end

  create_table "timetable_subjects", force: :cascade do |t|
    t.integer  "time_table_id"
    t.integer  "subject_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["subject_id"], name: "index_timetable_subjects_on_subject_id", using: :btree
    t.index ["time_table_id"], name: "index_timetable_subjects_on_time_table_id", using: :btree
  end

  add_foreign_key "slots", "subjects"
  add_foreign_key "timetable_subjects", "subjects"
  add_foreign_key "timetable_subjects", "time_tables"
end
