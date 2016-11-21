class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Competition side
  has_many :competition_participants
  has_many :competitions, through: :competition_participants

  has_many :created_competitions, :class_name => 'Competition', :foreign_key => 'creator_id'

  # Match side
  has_many :matches, through: :match_participants
  has_many :match_participants

  has_many :wins, :class_name => 'Match', :foreign_key => 'winner_id'
end
