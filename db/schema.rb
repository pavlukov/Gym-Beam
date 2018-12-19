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

ActiveRecord::Schema.define(version: 2018_12_16_151757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sport_sections", force: :cascade do |t|
    t.string "name"
    t.string "coach_name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "adress"
  end

  create_table "sport_sections_tickets", id: false, force: :cascade do |t|
    t.bigint "sport_section_id", null: false
    t.bigint "ticket_id", null: false
    t.index ["sport_section_id", "ticket_id"], name: "index_sport_sections_tickets_on_sport_section_id_and_ticket_id"
  end

  create_table "sport_sections_users", id: false, force: :cascade do |t|
    t.bigint "sport_section_id", null: false
    t.bigint "user_id", null: false
    t.index ["sport_section_id", "user_id"], name: "index_sport_sections_users_on_sport_section_id_and_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.date "expire_date"
    t.integer "visits_remaining"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets_users", force: :cascade do |t|
    t.bigint "ticket_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id", "user_id"], name: "index_tickets_users_on_ticket_id_and_user_id"
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

end
