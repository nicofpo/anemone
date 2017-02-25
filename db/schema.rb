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

ActiveRecord::Schema.define(version: 20170225201153) do

  create_table "nico_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name",                    collation: "utf8mb4_bin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_nico_tags_on_name", unique: true, using: :btree
  end

  create_table "nico_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "nid",        null: false, collation: "ascii_bin"
    t.string   "nickname"
    t.string   "icon_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nid"], name: "index_nico_users_on_nid", unique: true, using: :btree
  end

  create_table "nico_videos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "nid",                             null: false, collation: "ascii_bin"
    t.string   "title"
    t.text     "description",       limit: 65535
    t.string   "thumbnail_url"
    t.integer  "length"
    t.datetime "first_retrieve_at"
    t.integer  "user_id",                         null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["nid"], name: "index_nico_videos_on_nid", unique: true, using: :btree
    t.index ["user_id"], name: "index_nico_videos_on_user_id", using: :btree
  end

end
