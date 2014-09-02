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

ActiveRecord::Schema.define(version: 20140810163102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banners", force: true do |t|
    t.string   "image"
    t.string   "link"
    t.boolean  "is_horizontal", default: false, null: false
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calendars", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "position"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "position"
    t.integer  "sector_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "price"
    t.integer  "position"
    t.integer  "sector_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["sector_id", "created_at"], name: "index_items_on_sector_id_and_created_at", using: :btree

  create_table "matches", force: true do |t|
    t.string   "home"
    t.string   "guests"
    t.string   "where"
    t.string   "day"
    t.string   "date"
    t.string   "time"
    t.integer  "position"
    t.integer  "calendar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "role"
    t.string   "description"
    t.integer  "position"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "lead_image"
    t.text     "content"
    t.integer  "sector_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["sector_id", "created_at"], name: "index_posts_on_sector_id_and_created_at", using: :btree

  create_table "schedules", force: true do |t|
    t.string   "day"
    t.string   "time"
    t.string   "where"
    t.text     "map"
    t.integer  "position"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sectors", force: true do |t|
    t.string   "unique_name"
    t.string   "name"
    t.string   "lead_photo"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "is_root",                null: false
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "gallery_url"
    t.string   "sector_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sectors", ["remember_token"], name: "index_sectors_on_remember_token", using: :btree

  create_table "slides", force: true do |t|
    t.string   "image"
    t.string   "text"
    t.string   "link"
    t.integer  "position"
    t.integer  "sector_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slides", ["sector_id", "created_at"], name: "index_slides_on_sector_id_and_created_at", using: :btree

  create_table "static_pages", force: true do |t|
    t.string   "page_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploaded_files", force: true do |t|
    t.string   "attachment"
    t.string   "att_type"
    t.integer  "uploaded_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
