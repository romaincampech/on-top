class Team < ApplicationRecord
  has_attachment :profile_picture
  belongs_to :captain, :class_name => 'User', :foreign_key => 'captain_id'
  belongs_to :sport, optional: true
  has_many :team_memberships, dependent: :destroy
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
end
