class AddTeamSportBooleanToCompetitions < ActiveRecord::Migration[5.0]
  def change
    add_column :competitions, :team_sport, :boolean, null: false, default: false
  end
end
