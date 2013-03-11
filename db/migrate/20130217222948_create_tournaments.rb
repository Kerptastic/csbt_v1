class CreateTournaments < ActiveRecord::Migration
    def change
        create_table :tournaments do |t|
            #foreign keys
            t.integer 'bowling_center_id', :limit => 5
            t.integer 'oil_pattern_id', :limit => 5

            t.string 'name', :limit => 45, :null => false
            t.date 'date'
            t.string 'format', :limit => 45, :null => false, :default => 'Standard'
            t.timestamps
        end
    end
end
