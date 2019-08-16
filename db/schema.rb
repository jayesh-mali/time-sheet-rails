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

ActiveRecord::Schema.define(version: 2019_08_16_155619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.string "project_manager", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_projects_on_name"
    t.index ["project_manager"], name: "index_projects_on_project_manager"
  end

  create_table "time_logs", force: :cascade do |t|
    t.text "description"
    t.bigint "project_id", null: false
    t.bigint "created_by_id"
    t.bigint "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_time_logs_on_created_by_id"
    t.index ["project_id"], name: "index_time_logs_on_project_id"
    t.index ["updated_by_id"], name: "index_time_logs_on_updated_by_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "employee_id", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "time_logs", "users", column: "created_by_id"
  add_foreign_key "time_logs", "users", column: "updated_by_id"
end
