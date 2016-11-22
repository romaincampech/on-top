class AddStatusColumnToCompetitions < ActiveRecord::Migration[5.0]
  def change
    add_column :competitions, :status, :string
  end
end
