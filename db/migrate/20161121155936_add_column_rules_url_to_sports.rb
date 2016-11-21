class AddColumnRulesUrlToSports < ActiveRecord::Migration[5.0]
  def change
    add_column :sports, :sport_rules, :string
  end
end
