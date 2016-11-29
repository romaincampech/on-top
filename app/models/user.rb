class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]
  has_attachment :photo

  after_create :own_friend

  has_many :messages, dependent: :destroy
  has_many :team_memberships, dependent: :destroy
  has_many :teams, through: :team_memberships
  has_many :owned_teams, :class_name => 'Team', :foreign_key => 'captain_id', dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.to_h.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

# Competition side

  # competitions the user is part of (playing or spectating)
  has_many :competition_participants, dependent: :destroy
  has_many :competitions, through: :competition_participants

  # competitions the user is playing in (all statuses of completion and incompletion)
  has_many :competition_participations, -> { where(player: true) }, class_name: "CompetitionParticipant"
  has_many :playing_competitions, through: :competition_participations, source: :competition

  # competitions the user is spectating
  has_many :competition_nonparticipations, -> { where(player: false) }, class_name: "CompetitionParticipant"
  has_many :spectating_competitions, through: :competition_nonparticipations, source: :competition

  # competitions the user has created
  has_many :created_competitions, :class_name => 'Competition', :foreign_key => 'creator_id', dependent: :destroy

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
  has_many :match_participants, :class_name => 'MatchParticipant', :foreign_key => 'player_id', dependent: :destroy
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
  has_many :friend_requests, foreign_key: :friend_id, dependent: :destroy
  has_many :pending_friends_requests, class_name: 'FriendRequest', dependent: :destroy, foreign_key: :user_id
  has_many :pending_friends, through: :pending_friends_requests, source: :friend

  # friends the user has
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, :foreign_key => 'friend_id'


  def get_friendship(friend)
    friend.friendships.select{|fr| fr.friend == self}.first
  end

  def own_friend
    Friendship.create(user: self, friend: self)
  end

  def friend_captain_teams_for(sport)
    captains = []
    self.friends.each do |friend|
      captains << friend if friend.owned_teams.length > 0
    end
    teams = []
    captains.each do |captain|
      captain.owned_teams.each do |team|
        teams << team if team.sport == sport
      end
    end
    return teams
  end


# Search
  include AlgoliaSearch

  algoliasearch do
    attribute :first_name, :last_name, :email, :id, :photo
    attributesToIndex ['first_name', 'last_name', 'email', 'id', 'photo']
    # customRanking ['desc(likes_count)']
  end


end

