class ChangeNameInCompetitionsTable < ActiveRecord::Migration[5.0]
  def change
    change_column_default :competitions, :name, ""
  end
end
