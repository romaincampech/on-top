class AddColumnReadToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :read, :boolean, default: false
  end
end
