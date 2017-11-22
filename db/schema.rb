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

ActiveRecord::Schema.define(version: 20171121220009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "answer_id"
    t.bigint "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_comments_on_answer_id"
    t.index ["question_id"], name: "index_comments_on_question_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "content_chunks", force: :cascade do |t|
    t.text "type"
    t.text "title"
    t.text "intro"
    t.text "content"
    t.text "after"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "external_resources", force: :cascade do |t|
    t.integer "further_information_chunk_id", null: false
    t.text "title", null: false
    t.text "url", null: false
    t.text "size"
    t.text "resource_type"
    t.text "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["further_information_chunk_id"], name: "index_external_resources_on_further_information_chunk_id"
  end

  create_table "further_information_chunks", force: :cascade do |t|
    t.text "title"
    t.text "intro"
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

  create_table "questions", force: :cascade do |t|
    t.bigint "user_id"
    t.text "content"
    t.text "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_questions_on_slug"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "resources", force: :cascade do |t|
    t.text "type", null: false
    t.text "title", null: false
    t.text "intro", null: false
    t.text "contributed_by", null: false
    t.text "video_url"
    t.integer "content_chunk_1_id"
    t.integer "content_chunk_2_id"
    t.integer "content_chunk_3_id"
    t.integer "content_chunk_4_id"
    t.integer "content_chunk_5_id"
    t.integer "content_chunk_6_id"
    t.integer "content_chunk_7_id"
    t.integer "further_information_chunk_id"
    t.text "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_chunk_1_id"], name: "index_resources_on_content_chunk_1_id"
    t.index ["content_chunk_2_id"], name: "index_resources_on_content_chunk_2_id"
    t.index ["content_chunk_3_id"], name: "index_resources_on_content_chunk_3_id"
    t.index ["content_chunk_4_id"], name: "index_resources_on_content_chunk_4_id"
    t.index ["content_chunk_5_id"], name: "index_resources_on_content_chunk_5_id"
    t.index ["content_chunk_6_id"], name: "index_resources_on_content_chunk_6_id"
    t.index ["content_chunk_7_id"], name: "index_resources_on_content_chunk_7_id"
    t.index ["further_information_chunk_id"], name: "index_resources_on_further_information_chunk_id"
    t.index ["slug"], name: "index_resources_on_slug"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.text "description"
    t.text "slug"
    t.index ["name"], name: "index_tags_on_name", unique: true
    t.index ["slug"], name: "index_tags_on_slug"
  end

  create_table "uploaded_attachments", force: :cascade do |t|
    t.string "uploaded_file_file_name"
    t.string "uploaded_file_content_type"
    t.integer "uploaded_file_file_size"
    t.datetime "uploaded_file_updated_at"
    t.integer "further_information_chunk_id", null: false
    t.text "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["further_information_chunk_id"], name: "index_uploaded_attachments_on_further_information_chunk_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "title", default: ""
    t.text "first_name"
    t.text "last_name"
    t.integer "role", default: 0
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

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
