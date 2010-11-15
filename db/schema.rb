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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101115012602) do

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id",                      :null => false
    t.integer  "resource_id",                  :null => false
    t.string   "resource_type", :limit => 128, :null => false
    t.text     "body",                         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["resource_id", "resource_type"], :name => "index_comments_on_resource_id_and_resource_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "ratings", :force => true do |t|
    t.integer  "user_id",                      :null => false
    t.integer  "rating",                       :null => false
    t.integer  "resource_id",                  :null => false
    t.string   "resource_type", :limit => 128, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["resource_id", "resource_type"], :name => "index_ratings_on_resource_id_and_resource_type"
  add_index "ratings", ["user_id", "resource_id", "resource_type"], :name => "index_ratings_on_user_id_and_resource_id_and_resource_type", :unique => true

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "approved_at"
    t.integer  "ratings_count",   :default => 0,     :null => false
    t.integer  "comments_count",  :default => 0,     :null => false
    t.integer  "creator_user_id",                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tagline"
    t.string   "url"
    t.datetime "launched_at"
    t.boolean  "reference",       :default => false, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "comments_count",      :default => 0, :null => false
    t.integer  "sites_created_count", :default => 0, :null => false
    t.integer  "ratings_count",       :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sites_count",         :default => 0, :null => false
  end

end
