class CreateBowlingCenters < ActiveRecord::Migration
    def change
        create_table :bowling_centers do |t|
            t.string :name, :null => false
            t.string :url, :null => false
            t.timestamps
        end
    end
end
