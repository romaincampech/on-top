class AddColumnNumberOfRoundsToCompetitions < ActiveRecord::Migration[5.0]
  def change
    add_column :competitions, :number_of_rounds, :integer
  end
end
