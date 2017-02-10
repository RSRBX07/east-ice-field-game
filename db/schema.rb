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

ActiveRecord::Schema.define(version: 20170210143335) do

  create_table "animals", force: :cascade do |t|
    t.string   "name"
    t.string   "place"
    t.integer  "ice_field_game_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["ice_field_game_id"], name: "index_animals_on_ice_field_game_id"
  end

  create_table "bridges", force: :cascade do |t|
    t.integer  "pilars_count",      default: 6
    t.integer  "ice_field_game_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["ice_field_game_id"], name: "index_bridges_on_ice_field_game_id"
  end

  create_table "crows", force: :cascade do |t|
    t.integer  "advancement", default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "game_id"
  end

  create_table "dices", force: :cascade do |t|
    t.string   "showing_face"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "game_id"
  end

  create_table "fruits", force: :cascade do |t|
    t.string   "color"
    t.datetime "croped_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "orchard_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.datetime "finished_at"
    t.string   "status"
    t.string   "last_player_action"
  end

  create_table "games_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ice_field_dices", force: :cascade do |t|
    t.string   "showing_face"
    t.integer  "ice_field_game_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["ice_field_game_id"], name: "index_ice_field_dices_on_ice_field_game_id"
  end

  create_table "ice_field_games", force: :cascade do |t|
    t.string   "status"
    t.datetime "finished_at"
    t.string   "last_player_action"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "orchards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "nick"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
