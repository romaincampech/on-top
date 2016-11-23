class Match < ApplicationRecord
  belongs_to :competition
  has_one :sport, through: :competition
  belongs_to :winner, :class_name => 'User', :foreign_key => 'winner_id', optional: true

  has_many :match_participants
  has_many :players, through: :match_participants

  def played?
    self.winner_id?
  end

  def build_score(params)
    score = []

    set_1 = {}
    set_1[:player_1] = params["set1player1"].to_i
    set_1[:player_2] = params["set1player2"].to_i
    score << set_1
    set_2 = {}
    set_2[:player_1] = params["set2player1"].to_i
    set_2[:player_2] = params["set2player2"].to_i
    score << set_2
    set_3 = {}
    set_3[:player_1] = params["set3player1"].to_i
    set_3[:player_2] = params["set3player2"].to_i
    score << set_3

    self.score = score
    self.save
  end

  # def winner



end
