class AddScoreToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :score, :jsonb
  end
end
