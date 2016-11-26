class Competition < ApplicationRecord
  has_one :chat_room, dependent: :destroy

  has_many :competition_participants
  has_many :users, through: :competition_participants

  has_many :competition_players, -> { where(player: true) }, class_name: "CompetitionParticipant"
  has_many :players, through: :competition_players, source: :user

  has_many :competition_spectators, -> { where(player: false) }, class_name: "CompetitionParticipant"
  has_many :spectators, through: :competition_spectators, source: :user

  has_many :matches

  belongs_to :sport, optional: true
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  belongs_to :champion, :class_name => 'User', :foreign_key => 'champion_id', optional: true

  validates :creator_id, presence: true

  def new_chat
    ChatRoom.create(competition: self)
  end

  def add_players(array)
    array.each do |user|
      CompetitionParticipant.create(player: true, user: user, competition: self)
    end
  end

  def rem_sample(array)
    array.delete_at(rand(array.length))
  end

  def select_round_1
    self.matches.where(round: 1)
  end

  def assign_matches
    player_ary = self.players.to_a
    select_round_1.each do |match|
      2.times do
        MatchParticipant.create(player: rem_sample(player_ary), match: match)
      end
    end
  end

 def winner_match_assignment
  self.matches.each do |match|
      if match.match_number == 1 && match.played?
        MatchParticipant.create(player: match.winner, match: self.matches.where(match_number: (self.number_of_players / 2 + 1)).first)
      else
        mn = 2
        x = 1
        until mn == self.number_of_players
          if match.played?
            MatchParticipant.create(player: self.matches.where(match_number: mn).first.winner, match: self.matches.where(match_number: mn + number_of_players / 2 - x).first)
          end
          mn += 1
          if match.played?
            MatchParticipant.create(player: self.matches.where(match_number: mn).first.winner, match: self.matches.where(match_number: mn + number_of_players / 2 - x).first)
          end
          mn += 1
          x += 1
        end
      end
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

  def number_of_rounds(category)
    if category == "Knockout"
      Math.log2(self.number_of_players).to_i
    else
    end
  end

  def create_matches(category)
    if category == "Knockout"
    round_number = 1
    match_number = 0
      until self.number_of_players / 2**round_number < 1 do
        (self.number_of_players / 2**round_number).times do
          Match.create(competition_id: self.id, round: round_number, status: "To be played", match_number: match_number += 1)
        end
        round_number += 1
      end
    else
    end
  end
end
