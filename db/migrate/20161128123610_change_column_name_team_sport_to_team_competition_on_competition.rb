class ChangeColumnNameTeamSportToTeamCompetitionOnCompetition < ActiveRecord::Migration[5.0]
  def change
    rename_column :competitions, :team_sport, :team_competition
  end
end
