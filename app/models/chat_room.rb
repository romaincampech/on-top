class ChatRoom < ApplicationRecord
  belongs_to :competition, -> { where team_chat: false }
  belongs_to :team, -> { where team_chat: true }
  has_many :messages, dependent: :destroy
end
