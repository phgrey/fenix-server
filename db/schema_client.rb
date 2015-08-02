#/^enable_extension/ lines are commented and
# "hstore" is replaced with "string"
ActiveRecord::Schema.define(version: 20150801011225) do

  # These are extensions that must be enabled in order to support this database
  # enable_extension "plpgsql"
  # enable_extension "string"

  create_table "events", force: :cascade do |t|
    t.string   "comment"
    t.integer  "host_id"
    t.string   "installer",  limit: 10
    t.string   "params"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "events", ["host_id"], name: "index_events_on_host_id", using: :btree

  create_table "hosts", force: :cascade do |t|
    t.string   "key"
    t.string   "title"
    t.string   "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "installs", force: :cascade do |t|
    t.integer  "host_id"
    t.integer  "package_id"
    t.integer  "repository_id"
    t.integer  "event_id"
    t.string   "title"
    t.string   "installer"
    t.boolean  "removed"
    t.string   "params"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "installs", ["event_id"], name: "index_installs_on_event_id", using: :btree
  add_index "installs", ["host_id"], name: "index_installs_on_host_id", using: :btree
  add_index "installs", ["package_id"], name: "index_installs_on_package_id", using: :btree
  add_index "installs", ["repository_id"], name: "index_installs_on_repository_id", using: :btree
  add_index "installs", ["title"], name: "index_installs_on_title", using: :btree

  create_table "packages", force: :cascade do |t|
    t.string   "title"
    t.string   "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repositories", force: :cascade do |t|
    t.string   "url"
    t.string   "installer"
    t.string   "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "repositories", ["url", "installer"], name: "index_repositories_on_url_and_installer", unique: true, using: :btree
  add_index "repositories", ["url"], name: "index_repositories_on_url", using: :btree

  create_table "sources", force: :cascade do |t|
    t.integer  "host_id"
    t.integer  "repository_id"
    t.integer  "unseen",        default: 0
    t.datetime "seen_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "sources", ["host_id", "repository_id"], name: "index_sources_on_host_id_and_repository_id", unique: true, using: :btree
  add_index "sources", ["host_id"], name: "index_sources_on_host_id", using: :btree
  add_index "sources", ["repository_id"], name: "index_sources_on_repository_id", using: :btree

  add_foreign_key "events", "hosts"
  add_foreign_key "installs", "events"
  add_foreign_key "installs", "hosts"
  add_foreign_key "installs", "packages"
  add_foreign_key "installs", "repositories"
  add_foreign_key "sources", "hosts"
  add_foreign_key "sources", "repositories"
end
