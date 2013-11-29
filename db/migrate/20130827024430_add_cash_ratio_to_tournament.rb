class AddCashRatioToTournament < ActiveRecord::Migration
  def change
      add_column :tournaments, :cash_ratio_value, :integer, :limit => 3, :default => 4
  end
end
