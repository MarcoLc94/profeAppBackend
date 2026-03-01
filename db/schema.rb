ActiveRecord::Schema[7.1].define(version: 2026_02_28_191412) do
  create_table "logins", force: :cascade do |t|
    t.string "phone_number"
    t.string "password_digest"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_logins_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "grade_taught"
    t.string "school_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "logins", "users"
end
