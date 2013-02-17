class CreateBowlers < ActiveRecord::Migration
  def change
    create_table :bowlers do |t|
      t.string  "first_name",      :limit => 25,  :null => false
      t.string  "last_name",       :limit => 25,  :null => false
      t.string  "username",        :limit => 25,  :null => false
      t.string  "email",           :limit => 50,  :null => false
      t.date    "birthday"
      t.integer "height_ft",       :limit => 1
      t.integer "height_in",       :limit => 2
      t.date    "joined_date"
      t.string  "hometown_city",   :default => 'Denver'
      t.string  "hometown_state",  :default => 'Colorado'
      t.decimal "current_avg",     :precision => 5, :scale => 2
      t.decimal "career_avg",      :precision => 5, :scale => 2
      t.integer "num_titles",      :limit => 4
      t.string  "bio",             :limit => 1000
      t.string  "picture_url"
      t.integer "num_threes",      :limit => 3
      t.integer "num_eights",      :limit => 3
      t.integer "high_series",     :limit => 3
      t.integer "high_game",       :limit => 3

      t.references :contact_info
      t.timestamps
    end
  end

  def down
    drop_table :bowlers
  end
end
