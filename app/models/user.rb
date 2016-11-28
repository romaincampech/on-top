class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attachment :photo

  after_create :own_friend

  has_many :messages, dependent: :destroy
  has_many :team_memberships
  has_many :teams, through: :team_memberships

  def full_name
    "#{first_name} #{last_name}"
  end

# Competition side

  # competitions the user is part of (playing or spectating)
  has_many :competition_participants
  has_many :competitions, through: :competition_participants

  # competitions the user is playing in (all statuses of completion and incompletion)
  has_many :competition_participations, -> { where(player: true) }, class_name: "CompetitionParticipant"
  has_many :playing_competitions, through: :competition_participations, source: :competition

  # competitions the user is spectating
  has_many :competition_nonparticipations, -> { where(player: false) }, class_name: "CompetitionParticipant"
  has_many :spectating_competitions, through: :competition_nonparticipations, source: :competition

  # competitions the user has created
  has_many :created_competitions, :class_name => 'Competition', :foreign_key => 'creator_id'

  # competitions the user has won
  has_many :championships, :class_name => 'Competition', :foreign_key => 'champion_id'


  # competitions the player has played in that have an assigned winner
  def played_competitions
    self.playing_competitions.where.not(champion_id: nil)
  end

  # competitions the player has played in that DO NOT have an assigned winner
  def unplayed_competitions
    self.playing_competitions.where(champion_id: nil)
  end

  # competitions the player has not been the winner of
  def lost_championships
    played_competitions.where.not(champion_id: id)
  end

# Match side
  # matches the user is playing in (only participation option is playing)
  has_many :match_participants, :class_name => 'MatchParticipant', :foreign_key => 'player_id'
  has_many :matches, through: :match_participants

  # matches the player has won
  has_many :wins, :class_name => 'Match', :foreign_key => 'winner_id'

  # matches the player has played in that have an assigned winner
  def played_matches
    self.matches.where.not(winner_id: nil)
  end

  # matches the player has played in that DO NOT have an assigned winner
  def unplayed_matches
    self.matches.where(winner_id: nil)
  end

  # matches the player has not been the winner of
  def losses
    played_matches.where.not(winner_id: id)
  end

#Friend side
  # pending friend request the user sent
  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend

  # friends the user has
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, :foreign_key => 'friend_id'


  def get_friendship(friend)
    friend.friendships.select{|fr| fr.friend == self}.first
  end

  def own_friend
    Friendship.create(user: self, friend: self)
  end


# Search
  include AlgoliaSearch

  algoliasearch do
    attribute :first_name, :last_name, :email, :id, :photo
    attributesToIndex ['first_name', 'last_name', 'email', 'id', 'photo']
    # customRanking ['desc(likes_count)']
  end


end

