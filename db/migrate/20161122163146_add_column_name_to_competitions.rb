class AddColumnNameToCompetitions < ActiveRecord::Migration[5.0]
  def change
    add_column :competitions, :name, :string
  end
end
