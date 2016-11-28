class Team < ApplicationRecord
  belongs_to :captain, :class_name => 'User', :foreign_key => 'captain_id'
  belongs_to :sport, optional: true
  has_many :team_memberships
  has_many :users, through: :team_memberships
  validates_associated :captain
  validates_presence_of :captain

  def members
    self.users
  end

  def players
    self.users
  end


  def add_users(array)
    array.each do |user|
      TeamMembership.create(user: user, team: self)
    end
  end

  def new_chat
    ChatRoom.create(team_chat: true, team: self)
  end
end
