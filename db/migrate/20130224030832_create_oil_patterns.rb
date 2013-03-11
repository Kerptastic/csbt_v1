class CreateOilPatterns < ActiveRecord::Migration
    def change
        create_table :oil_patterns do |t|
            #columns
            t.string :name, :null => false
            t.string :url, :null => false

            #helpers
            t.timestamps
        end
    end
end
