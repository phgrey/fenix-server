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

ActiveRecord::Schema.define(version: 20150801011225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "host_repositories", force: :cascade do |t|
    t.integer  "host_id"
    t.integer  "repository_id"
    t.boolean  "active"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "host_repositories", ["host_id"], name: "index_host_repositories_on_host_id", using: :btree
  add_index "host_repositories", ["repository_id"], name: "index_host_repositories_on_repository_id", using: :btree

  create_table "hosts", force: :cascade do |t|
    t.string   "key"
    t.string   "title"
    t.hstore   "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "install_groups", force: :cascade do |t|
    t.string   "comment"
    t.integer  "host_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "install_groups", ["host_id"], name: "index_install_groups_on_host_id", using: :btree

  create_table "installs", force: :cascade do |t|
    t.integer  "host_id"
    t.integer  "package_id"
    t.integer  "repository_id"
    t.integer  "install_group_id"
    t.string   "version"
    t.string   "title"
    t.string   "installer"
    t.datetime "installed_at"
    t.datetime "uninstalled_at"
    t.hstore   "params"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "installs", ["host_id"], name: "index_installs_on_host_id", using: :btree
  add_index "installs", ["install_group_id"], name: "index_installs_on_install_group_id", using: :btree
  add_index "installs", ["package_id"], name: "index_installs_on_package_id", using: :btree
  add_index "installs", ["repository_id"], name: "index_installs_on_repository_id", using: :btree

  create_table "packages", force: :cascade do |t|
    t.string   "title"
    t.hstore   "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repositories", force: :cascade do |t|
    t.string   "url"
    t.string   "type"
    t.hstore   "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "host_repositories", "hosts"
  add_foreign_key "host_repositories", "repositories"
  add_foreign_key "install_groups", "hosts"
  add_foreign_key "installs", "hosts"
  add_foreign_key "installs", "install_groups"
  add_foreign_key "installs", "packages"
  add_foreign_key "installs", "repositories"
end
