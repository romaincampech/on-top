class Competition < ApplicationRecord
  has_many :users, through: :competition_participants
  has_many :competition_participants
  has_many :matches

  belongs_to :sport
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'




  def spectators
  end

  def competitors
  end
end
