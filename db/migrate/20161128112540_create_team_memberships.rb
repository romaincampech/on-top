class CreateTeamMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :team_memberships do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.boolean :captain, null: false, default: false

      t.timestamps
    end
  end
end
