class AddScoreParamsToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :score_params, :jsonb
  end
end
