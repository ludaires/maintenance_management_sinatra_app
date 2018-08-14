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

ActiveRecord::Schema.define(version: 20180814003012) do

  create_table "codes", force: :cascade do |t|
    t.string   "code"
    t.string   "code_type"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipments", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "location"
    t.string   "calibration_unit"
    t.float    "calibration_start"
    t.float    "calibration_end"
    t.float    "uncertainty"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "equipments", ["name"], name: "index_equipments_on_name"

  create_table "inspection_parts", force: :cascade do |t|
    t.integer "inspection_id"
    t.integer "part_id"
    t.text    "codes",         default: "--- []\n"
  end

  create_table "inspections", force: :cascade do |t|
    t.integer  "maintenance_id"
    t.string   "inspection_type"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maintenances", force: :cascade do |t|
    t.integer  "equipment_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "username",        null: false
    t.string "email",           null: false
    t.string "password_digest", null: false
  end

end
