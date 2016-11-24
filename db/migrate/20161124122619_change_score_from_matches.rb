class ChangeScoreFromMatches < ActiveRecord::Migration[5.0]
  def change
    remove_column :matches, :score, :text
  end
end
