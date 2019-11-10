# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_10_174843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "password_digest"
    t.integer "account_type"
    t.boolean "verified", default: false, null: false
    t.string "phone_number", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "owner_mode", default: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["phone_number"], name: "index_accounts_on_phone_number", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "institution_id"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["institution_id"], name: "index_categories_on_institution_id"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "featured_list_items", force: :cascade do |t|
    t.bigint "institution_id"
    t.bigint "favorite_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["favorite_id"], name: "index_featured_list_items_on_favorite_id"
    t.index ["institution_id"], name: "index_featured_list_items_on_institution_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.bigint "account_id"
    t.integer "institution_type"
    t.string "name", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_institutions_on_account_id"
    t.index ["latitude"], name: "index_institutions_on_latitude"
    t.index ["longitude"], name: "index_institutions_on_longitude"
  end

  create_table "item_dates", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "item_id"
    t.boolean "available", default: true
    t.datetime "start_at", default: "2019-11-10 00:00:00", null: false
    t.datetime "end_at", default: "2019-11-10 23:59:59", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_item_dates_on_item_id"
    t.index ["user_id"], name: "index_item_dates_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "category_id"
    t.float "cost", default: 0.0, null: false
    t.boolean "has_discount", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "institution_id"
    t.bigint "user_id"
    t.float "rating", default: 0.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["institution_id"], name: "index_reviews_on_institution_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "trial_period", default: true, null: false
    t.datetime "start_at", null: false
    t.datetime "end_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", default: "", null: false
    t.index ["account_id"], name: "index_users_on_account_id"
  end

  add_foreign_key "categories", "institutions"
  add_foreign_key "favorites", "users"
  add_foreign_key "featured_list_items", "favorites"
  add_foreign_key "featured_list_items", "institutions"
  add_foreign_key "institutions", "accounts"
  add_foreign_key "item_dates", "items"
  add_foreign_key "item_dates", "users"
  add_foreign_key "items", "categories"
  add_foreign_key "reviews", "institutions"
  add_foreign_key "reviews", "users"
  add_foreign_key "subscriptions", "users"
end
