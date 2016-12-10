class Match < ApplicationRecord
  belongs_to :competition
  has_one :sport, through: :competition
  belongs_to :winner, :class_name => 'User', :foreign_key => 'winner_id', optional: true

  has_many :match_participants, dependent: :destroy
  # has_many :players, through: :match_participants
  has_many :players, :class_name => 'User', :foreign_key => 'player_id', through: :match_participants

  def played?
    self.winner_id?
  end

  def set_build_score(params)
    score = {}

    set_1 = {}
    set_1[:player_1] = params["set1player1"].to_i
    set_1[:player_2] = params["set1player2"].to_i
    score[:set1] = set_1
    set_2 = {}
    set_2[:player_1] = params["set2player1"].to_i
    set_2[:player_2] = params["set2player2"].to_i
    score[:set2] = set_2
    set_3 = {}
    set_3[:player_1] = params["set3player1"].to_i
    set_3[:player_2] = params["set3player2"].to_i
    score[:set3] = set_3
    set_4 = {}
    set_4[:player_1] = params["set4player1"].to_i
    set_4[:player_2] = params["set4player2"].to_i
    score[:set4] = set_4
    set_5 = {}
    set_5[:player_1] = params["set5player1"].to_i
    set_5[:player_2] = params["set5player2"].to_i
    score[:set5] = set_5

    player_set_total = {}

    player_set_total[:player_1] = 0
    player_set_total[:player_2] = 0
    if score[:set1][:player_1] > score[:set1][:player_2]
      player_set_total[:player_1] += 1
    elsif score[:set1][:player_2] > score[:set1][:player_1]
      player_set_total[:player_2] += 1
    end

    if score[:set2][:player_1] > score[:set2][:player_2]
      player_set_total[:player_1] += 1
    elsif score[:set2][:player_2] > score[:set2][:player_1]
      player_set_total[:player_2] += 1
    end

    if score[:set3][:player_1] > score[:set3][:player_2]
      player_set_total[:player_1] += 1
    elsif score[:set3][:player_2] > score[:set3][:player_1]
      player_set_total[:player_2] += 1
    end

    if score[:set4][:player_1] > score[:set4][:player_2]
      player_set_total[:player_1] += 1
    elsif score[:set4][:player_2] > score[:set4][:player_1]
      player_set_total[:player_2] += 1
    end

    if score[:set5][:player_1] > score[:set5][:player_2]
      player_set_total[:player_1] += 1
    elsif score[:set5][:player_2] > score[:set5][:player_1]
      player_set_total[:player_2] += 1
    end
    score[:player_set_total] = player_set_total

    self.score = score
    self.save
  end

  def assign_winner(score)
    # if score["set1"]["player_1"] > score["set1"]["player_2"] && score["set2"]["player_1"] > score["set2"]["player_2"]
    #   self.winner_id = self.players.first.id
    # elsif score["set1"]["player_1"] > score["set1"]["player_2"] && score["set3"]["player_1"] > score["set3"]["player_2"]
    #   self.winner_id = self.players.first.id
    # elsif score["set2"]["player_1"] > score["set2"]["player_2"] && score["set3"]["player_1"] > score["set3"]["player_2"]
    #   self.winner_id = self.players.first.id
    # else
    #   self.winner_id = self.players.last.id
    # end

    if score["player_set_total"]["player_1"] > score["player_set_total"]["player_2"]
      self.winner_id = self.players.first.id
    elsif score["player_set_total"]["player_1"] < score["player_set_total"]["player_2"]
      self.winner_id = self.players.last.id
    else
      self.winner_id = 0
    end

  end

  def league_points
    @competition_participant = CompetitionParticipant.where(competition_id: self.competition_id, user_id: self.winner_id).first
    @competition_participant1 = CompetitionParticipant.where(competition_id: self.competition_id, user_id: self.players.first.id).first
    @competition_participant2 = CompetitionParticipant.where(competition_id: self.competition_id, user_id: self.players.last.id).first
    if self.sport.name == "Football" && self.winner_id != 0
      @competition_participant.points += 3
      @competition_participant.save
    elsif (self.sport.name == "Tennis" || self.sport.name == "Table-Tennis" || self.sport.name == "Squash") && self.winner_id != 0
      @competition_participant.points += 2
      @competition_participant.save
    else
      @competition_participant1.points += 1
      @competition_participant2.points += 1
      @competition_participant1.save
      @competition_participant2.save
    end
  end

  def last_match_knockout(competition)
    if self.round == Math.log2(competition.number_of_players).to_i
      competition.champion = self.winner
      competition.save
    end
  end

end
