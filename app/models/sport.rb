class Sport < ApplicationRecord
  has_many :competitions
  has_many :matches
end
