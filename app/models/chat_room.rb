class ChatRoom < ApplicationRecord
  belongs_to :user
  belongs_to :competition
end
