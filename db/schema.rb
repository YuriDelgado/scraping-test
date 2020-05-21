# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_21_174708) do

  create_table "judgements", force: :cascade do |t|
    t.string "file_number"
    t.string "claimant"
    t.string "defendant"
    t.text "summary"
    t.string "court_table"
    t.integer "notifications_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["notifications_id"], name: "index_judgements_on_notifications_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.text "body"
    t.integer "judgement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["judgement_id"], name: "index_notifications_on_judgement_id"
  end

  add_foreign_key "judgements", "notifications", column: "notifications_id"
  add_foreign_key "notifications", "judgements"
end
