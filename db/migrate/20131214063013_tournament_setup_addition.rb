class TournamentSetupAddition < ActiveRecord::Migration
  def change
      add_column :tournaments, :tournament_setup_id, :integer, :limit => 5
      add_column :tournaments, :activated, :boolean
  end
end
