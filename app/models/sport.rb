class Sport < ApplicationRecord
  has_many :competitions
  has_many :teams, dependent: :destroy
end
