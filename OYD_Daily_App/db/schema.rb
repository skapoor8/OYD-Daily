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

ActiveRecord::Schema.define(version: 20180621191135) do

  create_table "attendances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "student_id"
    t.datetime "when"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "information", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "school_id"
    t.datetime "date_visited"
    t.text "first_name"
    t.text "last_name"
    t.integer "age"
    t.datetime "birthdate"
    t.text "class_group"
    t.text "street"
    t.text "street2"
    t.text "city"
    t.text "state"
    t.text "postal_code"
    t.text "country"
    t.text "email"
    t.text "mobile_phone"
    t.text "home_phone"
    t.text "parental_contact"
    t.text "how_found"
    t.text "occupation"
    t.text "interest"
    t.text "body_issues"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mlt_attendances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "student_id"
    t.date "mlt_date"
    t.integer "course"
    t.integer "lesson"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_mlt_attendances_on_student_id"
  end

  create_table "new_student_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "student_id"
    t.integer "oyd_id"
    t.datetime "signup_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "school_name"
    t.integer "main_ins_id"
    t.integer "school_region"
    t.text "street"
    t.text "street2"
    t.text "city"
    t.text "state"
    t.text "postal_code"
    t.text "country"
    t.text "email"
    t.text "school_phone"
    t.integer "status"
    t.integer "standing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "oyd_id"
    t.text "first_name"
    t.text "middle_name"
    t.text "last_name"
    t.text "nick_name"
    t.integer "age"
    t.date "birth_date"
    t.text "status"
    t.text "drop_reason"
    t.text "position"
    t.text "rank"
    t.text "next_rank"
    t.text "class_group"
    t.text "street"
    t.text "street2"
    t.text "city"
    t.text "postal_code"
    t.text "country"
    t.text "email"
    t.text "mobile_phone"
    t.text "home_phone"
    t.text "parental_contact"
    t.text "occupation"
    t.text "how_found"
    t.integer "intern_points"
    t.date "last_test_date"
    t.date "next_test_date"
    t.text "facebook"
    t.text "instagram"
    t.text "twitter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "school_id"
    t.index ["school_id"], name: "index_students_on_school_id"
  end

  create_table "tests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "student_id"
    t.integer "oyd_id"
    t.date "test_date"
    t.string "rank_tested"
    t.boolean "pass_fail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_tests_on_student_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "oyd_id"
    t.integer "access_level"
    t.text "first_name"
    t.text "last_name"
    t.text "def_school"
    t.text "def_region"
    t.text "def_nat_area"
    t.text "auth_schools"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "title"
    t.string "email"
    t.string "password_hash"
    t.string "password_salt"
  end

  add_foreign_key "attendances", "students"
  add_foreign_key "mlt_attendances", "students"
  add_foreign_key "tests", "students"
end
