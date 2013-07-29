class AddBowlerRecordHelperFields < ActiveRecord::Migration
    def change
        add_column :entries, :total_pinfall, :integer, :default => 0, :null => false
        add_column :entries, :total_qual_pinfall, :integer, :default => 0, :null => false
        add_column :entries, :total_semi_pinfall, :integer, :default => 0, :null => false
        add_column :entries, :total_matchplay_pinfall, :integer, :default => 0, :null => false
        add_column :entries, :total_stepladder_pinfall, :integer, :default => 0, :null => false
        add_column :entries, :total_games, :integer, :default => 0, :null => false

        add_column :entries, :total_qual_games, :integer, :default => 0, :null => false
        add_column :entries, :total_semi_games, :integer, :default => 0, :null => false

        add_column :entries, :total_matchplay_games, :integer, :default => 0, :null => false
        add_column :entries, :total_matchplay_wins, :integer, :default => 0, :null => false

        add_column :entries, :total_stepladder_games, :integer, :default => 0, :null => false
        add_column :entries, :total_stepladder_wins, :integer, :default => 0, :null => false

        add_column :entries, :highest_3_game_set, :integer, :default => 0, :null => false
        add_column :entries, :highest_6_game_set, :integer, :default => 0, :null => false
        add_column :entries, :highest_8_game_set, :integer, :default => 0, :null => false
    end
end