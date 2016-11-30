class AddTeamChatBooleanToChatRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_rooms, :team_chat, :boolean, null: false, default: false
    add_reference :chat_rooms, :team, foreign_key: true
  end
end
