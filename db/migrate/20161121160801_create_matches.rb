class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.references :competition, foreign_key: true
      t.references :winner, foreign_key: {to_table: :users}
      t.string :status
      t.integer :round
      t.text :score

      t.timestamps
    end
  end
end
