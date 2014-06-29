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

ActiveRecord::Schema.define(version: 20140629215133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "sector_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lead_image_file_name"
    t.string   "lead_image_content_type"
    t.integer  "lead_image_file_size"
    t.datetime "lead_image_updated_at"
  end

  add_index "posts", ["sector_id", "created_at"], name: "index_posts_on_sector_id_and_created_at", using: :btree

  create_table "sectors", force: true do |t|
    t.string   "name"
    t.string   "icon"
    t.string   "color"
    t.string   "picasa_url"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "is_root",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "gallery_url"
    t.string   "sector_class"
  end

  add_index "sectors", ["remember_token"], name: "index_sectors_on_remember_token", using: :btree

  create_table "slides", force: true do |t|
    t.string   "text"
    t.string   "link"
    t.integer  "sector_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "priority",           null: false
  end

  add_index "slides", ["sector_id", "created_at"], name: "index_slides_on_sector_id_and_created_at", using: :btree

  create_table "uploaded_files", force: true do |t|
    t.string   "att_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

end
