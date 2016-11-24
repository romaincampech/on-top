class Match < ApplicationRecord
  belongs_to :competition
  has_one :sport, through: :competition
  belongs_to :winner, :class_name => 'User', :foreign_key => 'winner_id', optional: true

  has_many :match_participants
  # has_many :players, through: :match_participants
  has_many :players, :class_name => 'User', :foreign_key => 'player_id', through: :match_participants

  def played?
    self.winner_id?
  end
end
