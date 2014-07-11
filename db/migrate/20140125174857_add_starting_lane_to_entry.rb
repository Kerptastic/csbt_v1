class AddStartingLaneToEntry < ActiveRecord::Migration
  def change
      add_column :entries, :starting_lane, :integer, :limit => 3, :default => 0
  end
end
