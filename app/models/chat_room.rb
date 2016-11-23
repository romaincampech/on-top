class ChatRoom < ApplicationRecord
  belongs_to :competition
  has_many :messages, dependent: :destroy
end
