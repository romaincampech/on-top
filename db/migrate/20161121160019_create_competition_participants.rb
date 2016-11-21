class CreateCompetitionParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :competition_participants do |t|
      t.references :competition, foreign_key: true
      t.boolean :player
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
