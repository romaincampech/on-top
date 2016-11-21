class CreateMatchParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :match_participants do |t|
      t.references :player, foreign_key: {to_table: :users}
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
