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

ActiveRecord::Schema.define(version: 20161206112918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_tags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_tags_on_card_id", using: :btree
    t.index ["tag_id"], name: "index_card_tags_on_tag_id", using: :btree
  end

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "lng"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "result_cards", force: :cascade do |t|
    t.integer  "result_id"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_result_cards_on_card_id", using: :btree
    t.index ["result_id"], name: "index_result_cards_on_result_id", using: :btree
  end

  create_table "results", force: :cascade do |t|
    t.string   "length"
    t.float    "dep_lat"
    t.float    "dep_lng"
    t.float    "dest_lat"
    t.float    "dest_lng"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "result_card_id"
    t.index ["result_card_id"], name: "index_results_on_result_card_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_tags_on_card_id", using: :btree
  end

  add_foreign_key "card_tags", "cards"
  add_foreign_key "card_tags", "tags"
  add_foreign_key "result_cards", "cards"
  add_foreign_key "result_cards", "results"
  add_foreign_key "results", "result_cards"
  add_foreign_key "tags", "cards"
end
