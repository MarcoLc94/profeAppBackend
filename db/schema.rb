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

ActiveRecord::Schema[7.1].define(version: 2026_03_01_235940) do
  create_table "attendance_records", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "attendance_id", null: false
    t.string "status"
    t.boolean "is_justified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendance_id"], name: "index_attendance_records_on_attendance_id"
    t.index ["student_id"], name: "index_attendance_records_on_student_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_attendances_on_group_id"
  end

  create_table "behavior_entries", force: :cascade do |t|
    t.string "behavior_type"
    t.text "description"
    t.date "date"
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_behavior_entries_on_student_id"
  end

  create_table "grades", force: :cascade do |t|
    t.float "score"
    t.text "comment"
    t.integer "student_id", null: false
    t.integer "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_grades_on_student_id"
    t.index ["task_id"], name: "index_grades_on_task_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "grade"
    t.string "school_year"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "logins", force: :cascade do |t|
    t.string "phone_number"
    t.string "password_digest"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_logins_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "creation_date"
    t.datetime "expiration_date"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "date"
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_reports_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "names"
    t.string "last_names"
    t.integer "age"
    t.string "sex"
    t.float "height"
    t.float "weight"
    t.string "photo_url"
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_students_on_group_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.string "grade"
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_subjects_on_group_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "due_date"
    t.time "due_time"
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subject"
    t.index ["group_id"], name: "index_tasks_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "grade_taught"
    t.string "school_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendance_records", "attendances"
  add_foreign_key "attendance_records", "students"
  add_foreign_key "attendances", "groups"
  add_foreign_key "behavior_entries", "students"
  add_foreign_key "grades", "students"
  add_foreign_key "grades", "tasks"
  add_foreign_key "groups", "users"
  add_foreign_key "logins", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "reports", "students"
  add_foreign_key "students", "groups"
  add_foreign_key "subjects", "groups"
  add_foreign_key "tasks", "groups"
end
