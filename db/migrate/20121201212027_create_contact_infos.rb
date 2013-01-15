class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.string  "street", :limit => 100,  :null => false
      t.string  "city",   :limit => 25,   :null => false
      t.string  "state",  :limit => 2,    :null => false
      t.integer "zip",    :limit => 5,    :null => false
      t.timestamps
    end
  end

  def down
    drop_table :contact_infos
  end
end
