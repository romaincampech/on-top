class Competition < ApplicationRecord

  has_many :competition_participants, dependent: :destroy
  has_many :users, through: :competition_participants

  has_many :competition_players, -> { where(player: true) }, class_name: "CompetitionParticipant"
  has_many :players, through: :competition_players, source: :user

  has_many :competition_spectators, -> { where(player: false) }, class_name: "CompetitionParticipant"
  has_many :spectators, through: :competition_spectators, source: :user

  has_many :matches, dependent: :destroy

  belongs_to :sport
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  belongs_to :champion, :class_name => 'User', :foreign_key => 'champion_id', optional: true

  validates :creator_id, presence: true

  include PublicActivity::Common

  def add_players(array)
    array.each do |user|
      CompetitionParticipant.create(player: true, user: user, competition: self)
    end
    # CompetitionParticipant.create(player: true, user: User.find(0), competition: self) if self.players.count.odd?
  end

  def rem_sample(array)
    array.delete_at(rand(array.length))
  end

  def select_round_1
    self.matches.where(round: 1)
  end

  def assign_matches
    # creating match participants for all first round matches in a knockout
    if self.category == "Knockout"
      player_ary = self.players.to_a
      select_round_1.each do |match|
        2.times do
          MatchParticipant.create(player: rem_sample(player_ary), match: match)
        end
      end
    # creating match participants for all matches in league competition
    else
      games = self.players.to_a.combination(2).to_a
      mn = 1
      games.each do |fixture|
        MatchParticipant.create(player: fixture[0], match: self.matches.where(match_number: mn).first)
        MatchParticipant.create(player: fixture[1], match: self.matches.where(match_number: mn).first)
        mn += 1
      end
    end
  end

 def winner_match_assignment
  # creating match participants in the correct next round match once a match has been played and won
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

  def drawn_matches
    self.matches.where(winner_id: 0)
  end

  def number_of_rounds(category)
    if category == "Knockout"
      Math.log2(self.number_of_players).to_i
    elsif category == "League"
      self.number_of_players - 1
    end
  end

  def create_matches
    # creating all matches in knockout or league competition
    round_number = 1
    match_number = 0
    if self.category == "Knockout"
      until self.number_of_players / 2**round_number < 1
        (self.number_of_players / 2**round_number).times do
          Match.create(competition_id: self.id, round: round_number, status: "To be played", match_number: match_number += 1)
          end
          round_number += 1
        end
    else
      (((self.number_of_players ** 2) - self.number_of_players) / 2).times do
        Match.create(competition_id: self.id, status: "To be played", match_number: match_number += 1)
      end
    end
  end

  def league_table_data(players)
    league_table_data = []

    players.each do |player|
      player_data = {}
      player_data["name"] = player.user.first_name
      player_data["matches_played"] = player.user.played_matches.where(competition_id: self.id).count
      player_data["matches_won"] = player.user.played_matches.where(competition_id: self.id, winner_id: player.user.id).count
      player_data["matches_drawn"] = player.user.played_matches.where(competition_id: self.id, winner_id: 0).count
      player_data["matches_lost"] = player.user.played_matches.where(competition_id: self.id).count - (player.user.played_matches.where(competition_id: self.id, winner_id: player.user.id).count + player.user.played_matches.where(competition_id: self.id, winner_id: 0).count)

      league_table_data << player_data
    end
    return league_table_data
  end
end
