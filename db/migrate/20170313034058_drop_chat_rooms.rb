class DropChatRooms < ActiveRecord::Migration[5.0]
  def change
    drop_table :chat_rooms
  end
end
