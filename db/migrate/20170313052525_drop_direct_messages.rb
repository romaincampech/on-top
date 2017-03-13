class DropDirectMessages < ActiveRecord::Migration[5.0]
  def change
    drop_table :direct_messages
  end
end
