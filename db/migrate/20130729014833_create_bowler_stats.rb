class CreateBowlerStats < ActiveRecord::Migration
  def change
    create_table :bowler_stats do |t|
      #foreign keys
      t.integer 'bowler_id', :limit => 5
      t.integer 'high_3_game_set_id', :limit => 5
      t.integer 'high_4_game_set_id', :limit => 5
      t.integer 'high_6_game_set_id', :limit => 5
      t.integer 'high_8_game_set_id', :limit => 5

      #columns
      t.integer 'num_titles', :limit => 5
      t.integer 'num_majors', :limit => 5
      t.integer 'num_events', :limit => 5
      t.integer 'num_games', :limit => 5
      t.integer 'total_pinfall', :limit => 5
      t.decimal 'career_avg', :limit => 5, :precision => 5, :scale => 2
      t.integer 'career_money', :limit => 5
      t.integer 'num_cashes', :limit => 5
      t.integer 'match_play_games', :limit => 5
      t.integer 'match_play_wins', :limit => 5
      t.integer 'high_series', :limit => 3
      t.integer 'high_game', :limit => 3
      t.integer 'num_300s', :limit => 3
      t.integer 'num_800s', :limit => 3

      t.timestamps
    end
  end
end