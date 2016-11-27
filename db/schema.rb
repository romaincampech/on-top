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

ActiveRecord::Schema.define(version: 20161127210757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "trackable_type"
    t.integer  "trackable_id"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "key"
    t.text     "parameters"
    t.string   "recipient_type"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.integer  "competition_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["competition_id"], name: "index_chat_rooms_on_competition_id", using: :btree
  end

  create_table "competition_participants", force: :cascade do |t|
    t.integer  "competition_id"
    t.boolean  "player"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["competition_id"], name: "index_competition_participants_on_competition_id", using: :btree
    t.index ["user_id"], name: "index_competition_participants_on_user_id", using: :btree
  end

  create_table "competitions", force: :cascade do |t|
    t.string   "category"
    t.integer  "number_of_players"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "sport_id"
    t.integer  "creator_id"
    t.integer  "champion_id"
    t.string   "status"
    t.string   "name"
    t.index ["champion_id"], name: "index_competitions_on_champion_id", using: :btree
    t.index ["creator_id"], name: "index_competitions_on_creator_id", using: :btree
    t.index ["sport_id"], name: "index_competitions_on_sport_id", using: :btree
  end

  create_table "friend_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friend_requests_on_friend_id", using: :btree
    t.index ["user_id"], name: "index_friend_requests_on_user_id", using: :btree
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id", using: :btree
    t.index ["user_id"], name: "index_friendships_on_user_id", using: :btree
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
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "match_number"
    t.jsonb    "score"
    t.index ["competition_id"], name: "index_matches_on_competition_id", using: :btree
    t.index ["winner_id"], name: "index_matches_on_winner_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "chat_room_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "sports", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "sport_rules"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.boolean  "admin",                  default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "chat_rooms", "competitions"
  add_foreign_key "competition_participants", "competitions"
  add_foreign_key "competition_participants", "users"
  add_foreign_key "competitions", "sports"
  add_foreign_key "competitions", "users", column: "champion_id"
  add_foreign_key "competitions", "users", column: "creator_id"
  add_foreign_key "friend_requests", "users"
  add_foreign_key "friend_requests", "users", column: "friend_id"
  add_foreign_key "friendships", "users"
  add_foreign_key "friendships", "users", column: "friend_id"
  add_foreign_key "match_participants", "matches"
  add_foreign_key "match_participants", "users", column: "player_id"
  add_foreign_key "matches", "competitions"
  add_foreign_key "matches", "users", column: "winner_id"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
end
