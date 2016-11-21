class Match < ApplicationRecord
  belongs_to :competition
  belongs_to :winner, :class_name => 'User', :foreign_key => 'winner_id'

  has_many :users, through: :match_participants
  has_many :match_participants
end
