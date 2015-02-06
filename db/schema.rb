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

ActiveRecord::Schema.define(version: 20150206175028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "image_likes", force: :cascade do |t|
    t.integer  "image_id",   null: false
    t.integer  "liker_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "image_likes", ["image_id"], name: "index_image_likes_on_image_id", using: :btree
  add_index "image_likes", ["liker_id"], name: "index_image_likes_on_liker_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "img_url",    null: false
    t.string   "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "user_city"
  end

  add_index "images", ["img_url"], name: "index_images_on_img_url", using: :btree
  add_index "images", ["user_city"], name: "index_images_on_user_city", using: :btree
  add_index "images", ["user_id"], name: "index_images_on_user_id", using: :btree

  create_table "user_views", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_views", ["user_id"], name: "index_user_views_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.string   "skill_type",      null: false
    t.string   "gender",          null: false
    t.string   "city",            null: false
    t.text     "about_me"
    t.string   "experience"
    t.string   "compensation"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "avatar_img"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
