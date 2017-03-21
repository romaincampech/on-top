class AddColumnSportToMatches < ActiveRecord::Migration[5.0]
  def change
    add_reference :matches, :sport, foreign_key: true
  end
end
