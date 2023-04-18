# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_17_083032) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "articles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "legal_content_id", null: false
    t.string "domain"
    t.string "theme"
    t.string "sub_theme"
    t.text "text_title"
    t.text "article_title"
    t.text "requirement"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_content_id"], name: "index_articles_on_legal_content_id"
  end

  create_table "legal_contents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prompts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "content"
    t.string "model"
    t.string "title"
    t.uuid "legal_content_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_content_id"], name: "index_prompts_on_legal_content_id"
  end

  create_table "responses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "article_id", null: false
    t.uuid "prompt_id", null: false
    t.integer "prompt_tokens"
    t.integer "completion_tokens"
    t.integer "total_tokens"
    t.string "model"
    t.text "response"
    t.text "prompt_content"
    t.float "prompt_costs"
    t.float "completion_costs"
    t.float "total_costs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_responses_on_article_id"
    t.index ["prompt_id"], name: "index_responses_on_prompt_id"
  end

  add_foreign_key "articles", "legal_contents"
  add_foreign_key "prompts", "legal_contents"
  add_foreign_key "responses", "articles"
  add_foreign_key "responses", "prompts"
end
