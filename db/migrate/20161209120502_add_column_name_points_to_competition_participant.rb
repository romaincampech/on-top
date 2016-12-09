class AddColumnNamePointsToCompetitionParticipant < ActiveRecord::Migration[5.0]
  def change
    add_column :competition_participants, :points, :integer, default: 0
  end
end
