class AddFieldsToTournamentSetup < ActiveRecord::Migration
  def change
    create_table :tournament_setups do |t|
      #foreign keys
      # t.integer 'bowler_id', :limit => 5
      # t.integer 'high_3_game_set_id', :limit => 5
      # t.integer 'high_4_game_set_id', :limit => 5
      # t.integer 'high_6_game_set_id', :limit => 5
      # t.integer 'high_8_game_set_id', :limit => 5
# 
      #columns
      t.integer :starting_lane, :limit => 3
      t.integer :num_lanes, :limit => 3
      t.string :left_move_type
      t.string :right_move_type
      t.string :left_move_dir
      t.string :right_move_dir
      t.integer :left_move_amt, :limit => 1
      t.integer :right_move_amt, :limit => 1 
      
      t.timestamps
    end
  end
end
