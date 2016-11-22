class Competition < ApplicationRecord
  has_many :competition_participants
  has_many :users, through: :competition_participants

  has_many :competition_players, -> { where(player: true) }, class_name: "CompetitionParticipant"
  has_many :players, through: :competition_players, source: :user

  has_many :competition_spectators, -> { where(player: false) }, class_name: "CompetitionParticipant"
  has_many :spectators, through: :competition_spectators, source: :user

  has_many :matches

  belongs_to :sport
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  belongs_to :champion, :class_name => 'User', :foreign_key => 'champion_id'

  validates :creator_id, presence: true

  def create_matches
    round_number = 1
    until self.number_of_players / 2**round_number < 1 do
      (self.number_of_players / 2**round_number).times do
        Match.create(competition_id: self.id, round: round_number, status: "To be played")
      end
      round_number += 1
    end
  end

  def played?
    self.champion_id?
  end

  def raw_unplayed_matches
    self.matches.where(winner_id: nil)
  end

  def unplayed_matches
    unplayed_matches = []
    raw_unplayed_matches.each do |match|
      if match.match_participants.count >= 1
        unplayed_matches << match
      end
    end
    unplayed_matches
  end

  def played_matches
    self.matches.where.not(winner_id: nil)
  end

end
