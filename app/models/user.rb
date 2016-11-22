class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Competition side
  has_many :competition_participants
  has_many :competitions, through: :competition_participants

  has_many :competition_participations, -> { where(player: true) }, class_name: "CompetitionParticipant"
  has_many :playing_competitions, through: :competition_participations, source: :competition

  has_many :competition_nonparticipations, -> { where(player: false) }, class_name: "CompetitionParticipant"
  has_many :spectating_competitions, through: :competition_nonparticipations, source: :competition

  has_many :created_competitions, :class_name => 'Competition', :foreign_key => 'creator_id'

  has_many :championships, :class_name => 'Competition', :foreign_key => 'champion_id'

  def lost_championships
  end



  # Match side
  has_many :match_participants
  has_many :matches, through: :match_participants

  has_many :wins, :class_name => 'Match', :foreign_key => 'winner_id'

  def losses
  end

end
