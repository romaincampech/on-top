class AddColumChampionToCompetitions < ActiveRecord::Migration[5.0]
  def change
    add_reference :competitions, :champion, foreign_key: {to_table: :users}
  end
end
