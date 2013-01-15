class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :tournament, :null => false
      t.references :bowlers    , :null => false
      t.timestamps
    end
  end

  def down
    drop_table :entries
  end
end
