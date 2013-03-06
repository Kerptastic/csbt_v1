class AddMoreToTournament < ActiveRecord::Migration
    def change
        add_column :tournaments, :num_entries, :integer
        add_column :tournaments, :winner_id, :integer
        add_column :tournaments, :runner_up_id, :integer
        add_column :tournaments, :top_woman_id, :integer
        add_column :tournaments, :top_senior_id, :integer
        add_column :tournaments, :oil_pattern_id, :integer
        add_column :tournaments, :bowling_center_id, :integer
    end
end
