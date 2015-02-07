# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150207072115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "organizations", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "login_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "organizations", ["login_name"], name: "index_organizations_on_login_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "family_name",      null: false
    t.string   "given_name",       null: false
    t.string   "email",            null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "organization_id"
    t.string   "crypted_password"
    t.string   "salt"
  end

  add_index "users", ["organization_id", "email"], name: "index_users_on_organization_id_and_email", unique: true, using: :btree
  add_index "users", ["organization_id"], name: "index_users_on_organization_id", using: :btree

end
