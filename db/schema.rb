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

ActiveRecord::Schema.define(version: 2018_10_06_033700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: :cascade do |t|
    t.string "code"
    t.bigint "unit_id"
    t.boolean "is_active", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["unit_id"], name: "index_devices_on_unit_id"
  end

  create_table "message_logs", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "status_histories", force: :cascade do |t|
    t.bigint "device_id"
    t.boolean "relay1_mode"
    t.boolean "relay1_status"
    t.boolean "relay2_mode"
    t.boolean "relay2_status"
    t.boolean "relay3_mode"
    t.boolean "relay3_status"
    t.boolean "relay4_mode"
    t.boolean "relay4_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_status_histories_on_device_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.bigint "device_id"
    t.boolean "relay1_mode"
    t.boolean "relay1_status"
    t.boolean "relay2_mode"
    t.boolean "relay2_status"
    t.boolean "relay3_mode"
    t.boolean "relay3_status"
    t.boolean "relay4_mode"
    t.boolean "relay4_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_statuses_on_device_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "unit_code"
    t.string "name"
    t.string "address"
    t.text "description"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "devices", "units"
  add_foreign_key "status_histories", "devices"
  add_foreign_key "statuses", "devices"
end
