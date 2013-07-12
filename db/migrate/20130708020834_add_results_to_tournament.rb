class AddResultsToTournament < ActiveRecord::Migration
  def change
      add_column :tournaments, :winner_id, :integer, :limit => 5
      add_column :tournaments, :runner_up_id, :integer, :limit => 5
      add_column :tournaments, :top_woman_id, :integer, :limit => 5
      add_column :tournaments, :top_senior_id, :integer, :limit => 5
  end
end
