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

ActiveRecord::Schema.define(version: 20161217215752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 50
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "name",        limit: 100
    t.integer  "category_id"
    t.string   "genre",       limit: 50
    t.integer  "year"
    t.string   "company",     limit: 50
    t.integer  "image_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "games_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "game_id", null: false
    t.index ["game_id", "user_id"], name: "index_games_users_on_game_id_and_user_id", using: :btree
    t.index ["user_id", "game_id"], name: "index_games_users_on_user_id_and_game_id", using: :btree
  end

  create_table "gaming_systems", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "platform_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "file"
    t.float    "ave_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "platforms", force: :cascade do |t|
    t.string   "family",      limit: 50
    t.string   "name",        limit: 50
    t.integer  "category_id"
    t.integer  "image_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "followed_id", null: false
    t.integer  "follower_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
    t.index ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password",   limit: 32
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "values", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "image_id"
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
