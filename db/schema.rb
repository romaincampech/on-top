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

ActiveRecord::Schema.define(version: 20161121160903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competition_participants", force: :cascade do |t|
    t.integer  "competition_id"
    t.boolean  "competitor"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["competition_id"], name: "index_competition_participants_on_competition_id", using: :btree
    t.index ["user_id"], name: "index_competition_participants_on_user_id", using: :btree
  end

  create_table "competitions", force: :cascade do |t|
    t.string   "type"
    t.integer  "number_of_players"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "sport_id"
    t.integer  "creator_id"
    t.index ["creator_id"], name: "index_competitions_on_creator_id", using: :btree
    t.index ["sport_id"], name: "index_competitions_on_sport_id", using: :btree
  end

  create_table "match_participants", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_match_participants_on_match_id", using: :btree
    t.index ["player_id"], name: "index_match_participants_on_player_id", using: :btree
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "competition_id"
    t.integer  "winner_id"
    t.string   "status"
    t.integer  "round"
    t.text     "score"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["competition_id"], name: "index_matches_on_competition_id", using: :btree
    t.index ["winner_id"], name: "index_matches_on_winner_id", using: :btree
  end

  create_table "sports", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "sport_rules"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "competition_participants", "competitions"
  add_foreign_key "competition_participants", "users"
  add_foreign_key "competitions", "sports"
  add_foreign_key "competitions", "users", column: "creator_id"
  add_foreign_key "match_participants", "matches"
  add_foreign_key "match_participants", "users", column: "player_id"
  add_foreign_key "matches", "competitions"
  add_foreign_key "matches", "users", column: "winner_id"
end
