class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string  "name",           :limit => 55, :null => false
      t.date    "date",                         :null => false
      t.string  "bowling_center", :limit => 75, :null => false
      t.string  "format",         :limit => 25, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :tournaments
  end
end
