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

ActiveRecord::Schema.define(version: 20160424054702) do

  create_table "images", force: :cascade do |t|
    t.string   "filename"
    t.integer  "item_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "state"
  end

  add_index "images", ["item_id"], name: "index_images_on_item_id"
  add_index "images", ["user_id"], name: "index_images_on_user_id"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "preferences_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "nutrition_available"
    t.string   "calories"
    t.string   "calories_from_fat"
    t.string   "total_fat"
    t.string   "total_fat_percent"
    t.string   "total_carbohydrates"
    t.string   "total_carbohydrates_percent"
    t.string   "saturated_fat"
    t.string   "saturated_fat_percent"
    t.string   "dietary_fiber"
    t.string   "dietary_fiber_percent"
    t.string   "trans_fat"
    t.string   "sugars"
    t.string   "cholesterol"
    t.string   "cholesterol_percent"
    t.string   "protein"
    t.string   "sodium"
    t.string   "sodium_percent"
    t.string   "vitamin_c_percent"
    t.string   "calcium_percent"
    t.string   "iron_percent"
    t.string   "allergens"
    t.string   "ingredients"
  end

  add_index "items", ["preferences_id"], name: "index_items_on_preferences_id"

  create_table "items_menus", id: false, force: :cascade do |t|
    t.integer "item_id"
    t.integer "menu_id"
  end

  add_index "items_menus", ["item_id", "menu_id"], name: "index_items_menus_on_item_id_and_menu_id", unique: true

  create_table "items_users", id: false, force: :cascade do |t|
    t.integer "item_id"
    t.integer "user_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string   "meal"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id"

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
