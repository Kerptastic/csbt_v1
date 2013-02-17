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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121224054448) do

  create_table "bowlers", :force => true do |t|
    t.string   "first_name",             :limit => 25,                                                         :null => false
    t.string   "last_name",              :limit => 25,                                                         :null => false
    t.string   "username",               :limit => 25,                                                         :null => false
    t.string   "email",                  :limit => 50,                                                         :null => false
    t.date     "birthday"
    t.integer  "height_ft",              :limit => 1
    t.integer  "height_in",              :limit => 2
    t.date     "joined_date"
    t.string   "hometown_city",                                                        :default => "Denver"
    t.string   "hometown_state",                                                       :default => "Colorado"
    t.decimal  "current_avg",                            :precision => 5, :scale => 2
    t.decimal  "career_avg",                             :precision => 5, :scale => 2
    t.integer  "num_titles"
    t.string   "bio",                    :limit => 1000
    t.string   "picture_url"
    t.integer  "num_threes",             :limit => 3
    t.integer  "num_eights",             :limit => 3
    t.integer  "high_series",            :limit => 3
    t.integer  "high_game",              :limit => 3
    t.integer  "contact_info_id"
    t.datetime "created_at",                                                                                   :null => false
    t.datetime "updated_at",                                                                                   :null => false
    t.string   "encrypted_password",                                                   :default => "",         :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "bowlers", ["email"], :name => "index_bowlers_on_email", :unique => true
  add_index "bowlers", ["reset_password_token"], :name => "index_bowlers_on_reset_password_token", :unique => true

  create_table "contact_infos", :force => true do |t|
    t.string   "street",     :limit => 100, :null => false
    t.string   "city",       :limit => 25,  :null => false
    t.string   "state",      :limit => 2,   :null => false
    t.integer  "zip",        :limit => 8,   :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "entries", :force => true do |t|
    t.integer  "tournament_id", :null => false
    t.integer  "bowlers_id",    :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "games", :force => true do |t|
    t.integer  "tournament_id",              :null => false
    t.integer  "bowlers_id",                 :null => false
    t.integer  "number",                     :null => false
    t.integer  "score",         :limit => 3, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "tournaments", :force => true do |t|
    t.string   "name",           :limit => 55, :null => false
    t.date     "date",                         :null => false
    t.string   "bowling_center", :limit => 75, :null => false
    t.string   "format",         :limit => 25, :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

end
