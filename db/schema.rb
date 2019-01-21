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

ActiveRecord::Schema.define(version: 20181217140514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.string "title", null: false
    t.integer "episode_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "library_isas", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "library_isa_type"
    t.bigint "library_isa_id"
    t.boolean "active", default: true
    t.datetime "expiry_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_isa_type", "library_isa_id"], name: "index_library_isas_on_library_isa_type_and_library_isa_id"
    t.index ["user_id"], name: "index_library_isas_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name", null: false
    t.text "plot", null: false
    t.integer "year", null: false
    t.string "directed_by", null: false
    t.string "production_company", null: false
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_options", force: :cascade do |t|
    t.float "price", default: 0.0, null: false
    t.string "video_quality", default: "HD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "purchase_option_id", null: false
    t.string "status", default: "peding", null: false
    t.float "amount", default: 0.0, null: false
    t.string "media_type", default: "movie", null: false
    t.integer "media_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_option_id"], name: "index_purchases_on_purchase_option_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.bigint "tv_show_id", null: false
    t.integer "season_number", null: false
    t.text "plot", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tv_show_id"], name: "index_seasons_on_tv_show_id"
  end

  create_table "tv_shows", force: :cascade do |t|
    t.string "name", null: false
    t.text "plot", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "episodes", "seasons"
  add_foreign_key "library_isas", "users"
  add_foreign_key "purchases", "purchase_options"
  add_foreign_key "purchases", "users"
  add_foreign_key "seasons", "tv_shows"
end
