class CreateBowlers < ActiveRecord::Migration
    def change
        create_table :bowlers do |t|
            #foreign keys
            t.integer 'user_id', :limit => 5

            #columns
            t.string 'first_name', :limit => 25, :null => false
            t.string 'last_name', :limit => 25, :null => false
            t.date 'birthday'
            t.integer 'height_ft', :limit => 1
            t.integer 'height_in', :limit => 2
            t.date 'joined_date'
            t.string 'hometown_city', :default => 'Denver'
            t.string 'hometown_state', :default => 'CO'
            t.string 'bio', :limit => 1000
            t.string 'picture_url'

            #helpers
            t.timestamps
        end
    end

    #def down
    #  drop_table :bowlers
    #end
end
