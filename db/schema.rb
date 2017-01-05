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

ActiveRecord::Schema.define(version: 20170105092527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "codestreams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_files", force: :cascade do |t|
    t.string   "path"
    t.text     "content"
    t.integer  "package_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["package_id"], name: "index_package_files_on_package_id", using: :btree
  end

  create_table "packages", force: :cascade do |t|
    t.integer  "codestream_id"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["codestream_id"], name: "index_packages_on_codestream_id", using: :btree
  end

  add_foreign_key "package_files", "packages"
  add_foreign_key "packages", "codestreams"
end