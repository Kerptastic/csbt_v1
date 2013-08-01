class CreateTournamentTemplates < ActiveRecord::Migration
  def change
    create_table :tournament_templates do |t|

      t.timestamps
    end
  end
end
