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

ActiveRecord::Schema.define(:version => 20130827024430) do

  create_table "bowler_stats", :force => true do |t|
    t.integer  "bowler_id",          :limit => 8
    t.integer  "high_3_game_set_id", :limit => 8
    t.integer  "high_4_game_set_id", :limit => 8
    t.integer  "high_6_game_set_id", :limit => 8
    t.integer  "high_8_game_set_id", :limit => 8
    t.integer  "num_titles",         :limit => 8
    t.integer  "num_majors",         :limit => 8
    t.integer  "num_events",         :limit => 8
    t.integer  "num_games",          :limit => 8
    t.integer  "total_pinfall",      :limit => 8
    t.decimal  "career_avg",                      :precision => 5, :scale => 2
    t.integer  "career_money",       :limit => 8
    t.integer  "num_cashes",         :limit => 8
    t.integer  "match_play_games",   :limit => 8
    t.integer  "match_play_wins",    :limit => 8
    t.integer  "high_series",        :limit => 3
    t.integer  "high_game",          :limit => 3
    t.integer  "num_300s",           :limit => 3
    t.integer  "num_800s",           :limit => 3
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.decimal  "season_avg",                      :precision => 5, :scale => 2
  end

  create_table "bowlers", :force => true do |t|
    t.integer  "user_id",        :limit => 8
    t.string   "first_name",     :limit => 25,                         :null => false
    t.string   "last_name",      :limit => 25,                         :null => false
    t.date     "birthday"
    t.integer  "height_ft",      :limit => 1
    t.integer  "height_in",      :limit => 2
    t.date     "joined_date"
    t.string   "hometown_city",                  :default => "Denver"
    t.string   "hometown_state",                 :default => "CO"
    t.string   "bio",            :limit => 1000
    t.string   "picture_url"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  create_table "bowling_centers", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "url",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contact_infos", :force => true do |t|
    t.integer  "bowler_id",  :limit => 8
    t.string   "street",     :limit => 100, :null => false
    t.string   "city",       :limit => 25,  :null => false
    t.string   "state",      :limit => 2,   :null => false
    t.integer  "zip",        :limit => 8,   :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "entries", :force => true do |t|
    t.integer  "tournament_id",            :limit => 8
    t.integer  "bowler_id",                :limit => 8
    t.boolean  "is_qual_cut",                           :default => false
    t.boolean  "is_semi_cut",                           :default => false
    t.boolean  "is_high_woman",                         :default => false
    t.boolean  "is_high_senior",                        :default => false
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.boolean  "is_winner"
    t.boolean  "is_runner_up"
    t.integer  "total_pinfall",                         :default => 0,     :null => false
    t.integer  "total_qual_pinfall",                    :default => 0,     :null => false
    t.integer  "total_semi_pinfall",                    :default => 0,     :null => false
    t.integer  "total_matchplay_pinfall",               :default => 0,     :null => false
    t.integer  "total_stepladder_pinfall",              :default => 0,     :null => false
    t.integer  "total_games",                           :default => 0,     :null => false
    t.integer  "total_qual_games",                      :default => 0,     :null => false
    t.integer  "total_semi_games",                      :default => 0,     :null => false
    t.integer  "total_matchplay_games",                 :default => 0,     :null => false
    t.integer  "total_matchplay_wins",                  :default => 0,     :null => false
    t.integer  "total_stepladder_games",                :default => 0,     :null => false
    t.integer  "total_stepladder_wins",                 :default => 0,     :null => false
    t.integer  "highest_3_game_set",                    :default => 0,     :null => false
    t.integer  "highest_6_game_set",                    :default => 0,     :null => false
    t.integer  "highest_8_game_set",                    :default => 0,     :null => false
  end

  create_table "games", :force => true do |t|
    t.integer  "entry_id"
    t.integer  "score",      :null => false
    t.string   "gameid",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "oil_patterns", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "url",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tournament_templates", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tournaments", :force => true do |t|
    t.integer  "bowling_center_id", :limit => 8
    t.integer  "oil_pattern_id",    :limit => 8
    t.string   "name",              :limit => 45,                         :null => false
    t.date     "date"
    t.string   "format",            :limit => 45, :default => "Standard", :null => false
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.integer  "winner_id",         :limit => 8
    t.integer  "runner_up_id",      :limit => 8
    t.integer  "top_woman_id",      :limit => 8
    t.integer  "top_senior_id",     :limit => 8
    t.boolean  "is_major"
    t.integer  "cash_ratio_value",  :limit => 3,  :default => 4
  end

  create_table "users", :force => true do |t|
    t.string   "username",               :limit => 25,                    :null => false
    t.string   "email",                  :limit => 50,                    :null => false
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.string   "encrypted_password",                   :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                                :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
