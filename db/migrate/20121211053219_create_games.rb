class CreateGames < ActiveRecord::Migration
    def change
        create_table :games do |t|
            #foreign keys
            t.integer 'entry_id'

            #columns
            t.integer 'score', :null => false
            t.string 'gameid', :null => false

            #helpers
            t.timestamps
        end
    end


    def down

    end
end
