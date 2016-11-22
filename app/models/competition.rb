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
  belongs_to :champion, :class_name => 'User', :foreign_key => 'champion_id', optional: true

end
