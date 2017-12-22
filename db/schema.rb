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

ActiveRecord::Schema.define(version: 20171221190024) do

  create_table "courses", force: :cascade do |t|
    t.integer "year", null: false
    t.index ["year"], name: "index_courses_on_year"
  end

  create_table "enrolls", force: :cascade do |t|
    t.integer "student_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_enrolls_on_course_id"
    t.index ["student_id"], name: "index_enrolls_on_student_id"
  end

  create_table "scores", force: :cascade do |t|
    t.float "value", default: -1.0, null: false
    t.integer "student_id"
    t.integer "test_id"
    t.index ["student_id"], name: "index_scores_on_student_id"
    t.index ["test_id"], name: "index_scores_on_test_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "last_name", limit: 64, null: false
    t.string "first_name", limit: 64, null: false
    t.string "email", limit: 64, null: false
    t.integer "legajo", null: false
    t.integer "dni", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  create_table "test_courses", force: :cascade do |t|
    t.integer "course_id"
    t.integer "test_id"
    t.index ["course_id"], name: "index_test_courses_on_course_id"
    t.index ["test_id"], name: "index_test_courses_on_test_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "title", limit: 64, null: false
    t.datetime "date", null: false
    t.float "min_score", null: false
    t.float "max_score", null: false
  end

end
