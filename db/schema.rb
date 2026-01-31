# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2026_01_31_045600) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bouquet_flowers", force: :cascade do |t|
    t.bigint "flower_id", null: false
    t.bigint "bouquet_id", null: false
    t.integer "count", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bouquet_id", "flower_id"], name: "index_bouquet_flowers_on_bouquet_id_and_flower_id", unique: true
    t.index ["bouquet_id"], name: "index_bouquet_flowers_on_bouquet_id"
    t.index ["flower_id"], name: "index_bouquet_flowers_on_flower_id"
  end

  create_table "bouquets", force: :cascade do |t|
    t.bigint "celebration_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["celebration_id"], name: "index_bouquets_on_celebration_id", unique: true
  end

  create_table "celebrations", force: :cascade do |t|
    t.string "title", null: false
    t.string "giver_name", null: false
    t.string "receiver_name", null: false
    t.date "celebration_date"
    t.string "share_url", null: false
    t.bigint "user_id", null: false
    t.string "view_password_digest"
    t.boolean "is_accepting_letters", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_message"
    t.index ["share_url"], name: "index_celebrations_on_share_url", unique: true
    t.index ["user_id"], name: "index_celebrations_on_user_id"
  end

  create_table "flowers", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "word", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "letters", force: :cascade do |t|
    t.string "sender_name", null: false
    t.text "body", null: false
    t.bigint "celebration_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["celebration_id"], name: "index_letters_on_celebration_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "crypted_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "salt"
  end

  add_foreign_key "bouquet_flowers", "bouquets"
  add_foreign_key "bouquet_flowers", "flowers"
  add_foreign_key "bouquets", "celebrations"
  add_foreign_key "celebrations", "users"
  add_foreign_key "letters", "celebrations"
end
