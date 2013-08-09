class AddSeasonAverageToBowlerStats < ActiveRecord::Migration
  def change
    add_column :bowler_stats, :season_avg, :decimal, :precision => 5, :scale => 2
  end
end
