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

ActiveRecord::Schema.define(version: 20170225235504) do

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

  create_table "nico_video_taggings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "video_id",   null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_nico_video_taggings_on_tag_id", using: :btree
    t.index ["video_id", "tag_id"], name: "index_nico_video_taggings_on_video_id_and_tag_id", unique: true, using: :btree
    t.index ["video_id"], name: "index_nico_video_taggings_on_video_id", using: :btree
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

  create_table "user_ext_auths", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false, collation: "ascii_bin"
    t.string   "uid",        null: false, collation: "ascii_bin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_user_ext_auths_on_provider_and_uid", unique: true, using: :btree
    t.index ["user_id"], name: "index_user_ext_auths_on_user_id", using: :btree
  end

  create_table "user_nico_tag_followings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id",     null: false
    t.integer  "nico_tag_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["nico_tag_id"], name: "index_user_nico_tag_followings_on_nico_tag_id", using: :btree
    t.index ["user_id", "nico_tag_id"], name: "index_user_nico_tag_followings_on_user_id_and_nico_tag_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_user_nico_tag_followings_on_user_id", using: :btree
  end

  create_table "user_nico_user_followings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id"
    t.integer  "nico_user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["nico_user_id"], name: "index_user_nico_user_followings_on_nico_user_id", using: :btree
    t.index ["user_id", "nico_user_id"], name: "index_user_nico_user_followings_on_user_id_and_nico_user_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_user_nico_user_followings_on_user_id", using: :btree
  end

  create_table "user_sessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id",     null: false
    t.string   "token",       null: false, collation: "ascii_bin"
    t.string   "user_agent"
    t.string   "remote_addr"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["token"], name: "index_user_sessions_on_token", unique: true, using: :btree
    t.index ["user_id"], name: "index_user_sessions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_ext_auths", "users"
  add_foreign_key "user_nico_tag_followings", "users"
  add_foreign_key "user_nico_user_followings", "users"
  add_foreign_key "user_sessions", "users"
end
