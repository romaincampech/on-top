class AddColumnsSportAndCreatorToCompetitions < ActiveRecord::Migration[5.0]
  def change
    add_reference :competitions, :sport, foreign_key: true
    add_reference :competitions, :creator, foreign_key: {to_table: :users}
  end
end
