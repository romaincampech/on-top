class AddColumnMatchNumberToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :match_number, :integer
  end
end
