class CreateOilPatterns < ActiveRecord::Migration
  def change
    create_table :oil_patterns do |t|
      t.string :name, :null => false
      t.string :url, :null => false
      t.timestamps
    end
  end
end
