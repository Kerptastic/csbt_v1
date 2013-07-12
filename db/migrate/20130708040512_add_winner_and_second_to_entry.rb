class AddWinnerAndSecondToEntry < ActiveRecord::Migration
  def change
      add_column :entries, :is_winner, :boolean
      add_column :entries, :is_runner_up, :boolean
  end
end
