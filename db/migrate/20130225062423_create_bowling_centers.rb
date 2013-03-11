class CreateBowlingCenters < ActiveRecord::Migration
    def change
        create_table :bowling_centers do |t|
            #columns
            t.string :name, :null => false
            t.string :url, :null => false

            #helpers
            t.timestamps
        end
    end
end
