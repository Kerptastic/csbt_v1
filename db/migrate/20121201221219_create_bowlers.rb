class CreateBowlers < ActiveRecord::Migration
  def change
    create_table :bowlers do |t|
      t.string  "first_name",      :limit => 25,  :null => false
      t.string  "last_name",       :limit => 25,  :null => false
      t.string  "username",        :limit => 25,  :null => false
      t.string  "email",           :limit => 50,  :null => false
      t.references :contact_info
      t.timestamps
    end
  end

  def down
    drop_table :bowlers
  end
end
