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

ActiveRecord::Schema.define(version: 20160311071648) do

  create_table "items", force: :cascade do |t|
    t.string   "name"
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

  create_table "items_menus", id: false, force: :cascade do |t|
    t.integer "item_id"
    t.integer "menu_id"
  end

  add_index "items_menus", ["item_id", "menu_id"], name: "index_items_menus_on_item_id_and_menu_id", unique: true

  create_table "menus", force: :cascade do |t|
    t.string   "meal"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
