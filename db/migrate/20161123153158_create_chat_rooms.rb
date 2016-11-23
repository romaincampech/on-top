class CreateChatRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_rooms do |t|
      t.reference :competition
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
