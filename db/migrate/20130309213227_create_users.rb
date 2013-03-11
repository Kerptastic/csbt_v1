class CreateUsers < ActiveRecord::Migration
    def change
        create_table :users do |t|
            #columns
            t.string 'username', :limit => 25, :null => false
            t.string 'email', :limit => 50, :null => false

            #helpers
            t.timestamps
        end
    end
end
