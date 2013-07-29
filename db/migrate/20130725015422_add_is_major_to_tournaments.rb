class AddIsMajorToTournaments < ActiveRecord::Migration
  def change
      add_column :tournaments, :is_major, :boolean
  end
end
