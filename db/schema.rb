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

ActiveRecord::Schema.define(version: 2018_11_08_224512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class_posts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fileps", force: :cascade do |t|
    t.string "filepable_type"
    t.bigint "filepable_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_id"
    t.index ["filepable_type", "filepable_id"], name: "index_fileps_on_filepable_type_and_filepable_id"
    t.index ["post_id"], name: "index_fileps_on_post_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pdfs", force: :cascade do |t|
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "class_post_id"
    t.bigint "admin_id"
    t.string "name"
    t.text "description"
    t.string "addressedTo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_posts_on_admin_id"
    t.index ["class_post_id"], name: "index_posts_on_class_post_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "name"
    t.integer "hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules_students", id: false, force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "schedule_id"
    t.index ["schedule_id"], name: "index_schedules_students_on_schedule_id"
    t.index ["student_id"], name: "index_schedules_students_on_student_id"
  end

  create_table "schedules_tutors", id: false, force: :cascade do |t|
    t.bigint "tutor_id"
    t.bigint "schedule_id"
    t.index ["schedule_id"], name: "index_schedules_tutors_on_schedule_id"
    t.index ["tutor_id"], name: "index_schedules_tutors_on_tutor_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "age"
    t.integer "stratus"
    t.integer "pbm"
    t.bigint "tutor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tutorings", force: :cascade do |t|
    t.bigint "topic_id"
    t.string "type_t"
    t.bigint "schedule_id"
    t.integer "duration"
    t.text "noteStudent"
    t.text "noteTutor"
    t.bigint "student_id"
    t.date "date"
    t.integer "score"
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_tutorings_on_schedule_id"
    t.index ["student_id"], name: "index_tutorings_on_student_id"
    t.index ["topic_id"], name: "index_tutorings_on_topic_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.integer "ammountStudents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "cellphone"
    t.bigint "career_id"
    t.string "userable_type"
    t.bigint "userable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "lastname"
    t.string "pict"
    t.index ["userable_type", "userable_id"], name: "index_users_on_userable_type_and_userable_id"
  end

  add_foreign_key "posts", "admins"
  add_foreign_key "posts", "class_posts"
  add_foreign_key "schedules_students", "schedules"
  add_foreign_key "schedules_students", "students"
  add_foreign_key "schedules_tutors", "schedules"
  add_foreign_key "schedules_tutors", "tutors"
  add_foreign_key "students", "tutors"
  add_foreign_key "tutorings", "schedules"
  add_foreign_key "tutorings", "students"
  add_foreign_key "tutorings", "topics"
end
