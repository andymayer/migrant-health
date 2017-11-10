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

ActiveRecord::Schema.define(version: 20171110132136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "content_chunks", force: :cascade do |t|
    t.text "type"
    t.text "title"
    t.text "intro"
    t.text "content"
    t.text "after"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "further_informations", force: :cascade do |t|
    t.text "title"
    t.text "intro"
    t.text "info_1_url"
    t.text "info_1_title"
    t.text "info_2_url"
    t.text "info_2_title"
    t.text "info_3_url"
    t.text "info_3_title"
    t.text "info_4_url"
    t.text "info_4_title"
    t.text "info_5_url"
    t.text "info_5_title"
    t.text "info_6_url"
    t.text "info_6_title"
    t.text "after"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "resources", force: :cascade do |t|
    t.text "type", null: false
    t.text "title", null: false
    t.text "intro", null: false
    t.text "video_url"
    t.integer "content_chunk_1_id"
    t.integer "content_chunk_2_id"
    t.integer "content_chunk_3_id"
    t.integer "content_chunk_4_id"
    t.integer "content_chunk_5_id"
    t.integer "content_chunk_6_id"
    t.integer "content_chunk_7_id"
    t.integer "further_information_id"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
