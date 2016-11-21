class CompetitionParticipant < ApplicationRecord
  belongs_to :competition
  belongs_to :user

  def player?
  end
end
