class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.references :captain, foreign_key: {to_table: :users}
      t.string :name
      t.string :city
      t.timestamps
    end
  end
end
