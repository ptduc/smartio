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

ActiveRecord::Schema.define(version: 2018_10_25_143749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commands", force: :cascade do |t|
    t.bigint "device_id"
    t.string "code"
    t.integer "action", limit: 2
    t.text "command"
    t.integer "status", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_commands_on_device_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "code"
    t.bigint "unit_id"
    t.boolean "is_active", default: true
    t.string "ip_address"
    t.integer "port"
    t.integer "ftime"
    t.integer "panel", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_devices_on_unit_id"
  end

  create_table "message_logs", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at"
  end

  create_table "status_histories", force: :cascade do |t|
    t.bigint "device_id"
    t.integer "relay1_mode", limit: 2
    t.boolean "relay1_status"
    t.integer "time1_on", limit: 2
    t.integer "time1_off", limit: 2
    t.integer "times1"
    t.string "times1_0"
    t.string "times1_1"
    t.string "times1_2"
    t.string "times1_3"
    t.string "times1_4"
    t.integer "on1_0", limit: 2
    t.integer "on1_1", limit: 2
    t.integer "on1_2", limit: 2
    t.integer "on1_3", limit: 2
    t.integer "on1_4", limit: 2
    t.integer "relay2_mode", limit: 2
    t.boolean "relay2_status"
    t.integer "time2_on", limit: 2
    t.integer "time2_off", limit: 2
    t.integer "times2"
    t.string "times2_0"
    t.string "times2_1"
    t.string "times2_2"
    t.string "times2_3"
    t.string "times2_4"
    t.integer "on2_0", limit: 2
    t.integer "on2_1", limit: 2
    t.integer "on2_2", limit: 2
    t.integer "on2_3", limit: 2
    t.integer "on2_4", limit: 2
    t.integer "relay3_mode", limit: 2
    t.boolean "relay3_status"
    t.integer "time3_on", limit: 2
    t.integer "time3_off", limit: 2
    t.integer "times3"
    t.string "times3_0"
    t.string "times3_1"
    t.string "times3_2"
    t.string "times3_3"
    t.string "times3_4"
    t.integer "on3_0", limit: 2
    t.integer "on3_1", limit: 2
    t.integer "on3_2", limit: 2
    t.integer "on3_3", limit: 2
    t.integer "on3_4", limit: 2
    t.integer "relay4_mode", limit: 2
    t.boolean "relay4_status"
    t.integer "time4_on", limit: 2
    t.integer "time4_off", limit: 2
    t.integer "times4"
    t.string "times4_0"
    t.string "times4_1"
    t.string "times4_2"
    t.string "times4_3"
    t.string "times4_4"
    t.integer "on4_0", limit: 2
    t.integer "on4_1", limit: 2
    t.integer "on4_2", limit: 2
    t.integer "on4_3", limit: 2
    t.integer "on4_4", limit: 2
    t.datetime "created_at"
    t.index ["device_id"], name: "index_status_histories_on_device_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.bigint "device_id"
    t.integer "relay1_mode", limit: 2
    t.boolean "relay1_status"
    t.integer "time1_on", limit: 2
    t.integer "time1_off", limit: 2
    t.integer "times1"
    t.string "times1_0"
    t.string "times1_1"
    t.string "times1_2"
    t.string "times1_3"
    t.string "times1_4"
    t.integer "on1_0", limit: 2
    t.integer "on1_1", limit: 2
    t.integer "on1_2", limit: 2
    t.integer "on1_3", limit: 2
    t.integer "on1_4", limit: 2
    t.integer "relay2_mode", limit: 2
    t.boolean "relay2_status"
    t.integer "time2_on", limit: 2
    t.integer "time2_off", limit: 2
    t.integer "times2"
    t.string "times2_0"
    t.string "times2_1"
    t.string "times2_2"
    t.string "times2_3"
    t.string "times2_4"
    t.integer "on2_0", limit: 2
    t.integer "on2_1", limit: 2
    t.integer "on2_2", limit: 2
    t.integer "on2_3", limit: 2
    t.integer "on2_4", limit: 2
    t.integer "relay3_mode", limit: 2
    t.boolean "relay3_status"
    t.integer "time3_on", limit: 2
    t.integer "time3_off", limit: 2
    t.integer "times3"
    t.string "times3_0"
    t.string "times3_1"
    t.string "times3_2"
    t.string "times3_3"
    t.string "times3_4"
    t.integer "on3_0", limit: 2
    t.integer "on3_1", limit: 2
    t.integer "on3_2", limit: 2
    t.integer "on3_3", limit: 2
    t.integer "on3_4", limit: 2
    t.integer "relay4_mode", limit: 2
    t.boolean "relay4_status"
    t.integer "time4_on", limit: 2
    t.integer "time4_off", limit: 2
    t.integer "times4"
    t.string "times4_0"
    t.string "times4_1"
    t.string "times4_2"
    t.string "times4_3"
    t.string "times4_4"
    t.integer "on4_0", limit: 2
    t.integer "on4_1", limit: 2
    t.integer "on4_2", limit: 2
    t.integer "on4_3", limit: 2
    t.integer "on4_4", limit: 2
    t.datetime "updated_at"
    t.index ["device_id"], name: "index_statuses_on_device_id"
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

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username"
    t.string "fullname"
    t.bigint "unit_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level", default: 1
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unit_id"], name: "index_users_on_unit_id"
  end

  add_foreign_key "commands", "devices"
  add_foreign_key "devices", "units"
  add_foreign_key "status_histories", "devices"
  add_foreign_key "statuses", "devices"
  add_foreign_key "users", "units"
end
