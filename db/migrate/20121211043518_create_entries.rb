class CreateEntries < ActiveRecord::Migration
    def change
        create_table :entries do |t|
            #foreign keys
            t.integer 'tournament_id', :limit => 5
            t.integer 'bowler_id', :limit => 5

            #columns
            t.boolean 'is_qual_cut', :default => false
            t.boolean 'is_semi_cut', :default => false
            t.boolean 'is_high_woman', :default => false
            t.boolean 'is_high_senior', :default => false

            #helpers
            t.timestamps
        end
    end

    #def down
    #  drop_table :entries
    #end
end
