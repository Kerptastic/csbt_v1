class CreateTournaments < ActiveRecord::Migration
    def change
        create_table :tournaments do |t|
            t.string 'name',           :limit => 45, :null => false
            t.date   'date'
            t.string 'format'        , :limit => 45, :null => false, :default => 'Standard'
            t.timestamps
        end
    end
end
