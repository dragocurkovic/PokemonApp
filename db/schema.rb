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

ActiveRecord::Schema.define(version: 20160815203202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "moves", force: :cascade do |t|
    t.string   "name"
    t.integer  "accuracy"
    t.integer  "effect_chance"
    t.integer  "pp"
    t.integer  "priority"
    t.integer  "power"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "type_id"
  end

  add_index "moves", ["type_id"], name: "index_moves_on_type_id", using: :btree

  create_table "pokemon_battle_rounds", force: :cascade do |t|
    t.integer  "damage"
    t.integer  "move_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "pokemon_ownership_id"
    t.integer  "pokemon_battle_id"
  end

  add_index "pokemon_battle_rounds", ["move_id"], name: "index_pokemon_battle_rounds_on_move_id", using: :btree
  add_index "pokemon_battle_rounds", ["pokemon_battle_id"], name: "index_pokemon_battle_rounds_on_pokemon_battle_id", using: :btree
  add_index "pokemon_battle_rounds", ["pokemon_ownership_id"], name: "index_pokemon_battle_rounds_on_pokemon_ownership_id", using: :btree

  create_table "pokemon_battles", force: :cascade do |t|
    t.integer  "first_pokemon_ownership_id"
    t.integer  "second_pokemon_ownership_id"
    t.integer  "winner_id"
    t.integer  "first_pokemon_hp",            default: 100
    t.integer  "second_pokemon_hp",           default: 100
    t.integer  "battle_status",               default: 0
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "pokemon_moves", force: :cascade do |t|
    t.integer  "move_id"
    t.integer  "pokemon_ownership_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "pokemon_moves", ["move_id"], name: "index_pokemon_moves_on_move_id", using: :btree
  add_index "pokemon_moves", ["pokemon_ownership_id"], name: "index_pokemon_moves_on_pokemon_ownership_id", using: :btree

  create_table "pokemon_ownerships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pokemon_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "avatar_data"
  end

  add_index "pokemon_ownerships", ["pokemon_id"], name: "index_pokemon_ownerships_on_pokemon_id", using: :btree
  add_index "pokemon_ownerships", ["user_id"], name: "index_pokemon_ownerships_on_user_id", using: :btree

  create_table "pokemons", force: :cascade do |t|
    t.string   "name"
    t.integer  "height"
    t.integer  "weight"
    t.integer  "base_experience"
    t.string   "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "type_id"
  end

  add_index "pokemons", ["type_id"], name: "index_pokemons_on_type_id", using: :btree

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "username",                            null: false
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
    t.string   "token_hash"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.boolean  "upvoted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "pokemon_id"
    t.integer  "user_id"
  end

  add_index "votes", ["pokemon_id"], name: "index_votes_on_pokemon_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "moves", "types"
  add_foreign_key "pokemon_battle_rounds", "moves"
  add_foreign_key "pokemon_battle_rounds", "pokemon_battles"
  add_foreign_key "pokemon_battle_rounds", "pokemon_ownerships"
  add_foreign_key "pokemon_moves", "moves"
  add_foreign_key "pokemon_moves", "pokemon_ownerships"
  add_foreign_key "pokemon_ownerships", "pokemons"
  add_foreign_key "pokemon_ownerships", "users"
  add_foreign_key "pokemons", "types"
  add_foreign_key "votes", "pokemons"
  add_foreign_key "votes", "users"
end
