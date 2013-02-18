class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :tournament,               :null => false
      t.references :bowlers    ,              :null => false
      t.integer :number       ,               :null => false
      t.integer :score        , :limit => 3,  :null => false
      t.timestamps
    end
  end

  def down
    drop_table :games
  end
end
