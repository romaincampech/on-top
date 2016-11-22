class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show]

  def show
  end

  def new
    @competition = Competition.new
  end

  def create
    @competition = Competition.new(competition_params)
    @competition.creator = current_user
    @competition.sport_id = Sport.where(name: params[:sport]).first.id
    @competition.save
    round_number = 1
    until @competition.number_of_players / 2^round_number < 1 do
      (@competition.number_of_players / 2^round_number).times do
        @match = Match.create(competition_id: @competition.id, round: round_number, status: "To be played")
      end
      round_number += 1
    end
    redirect_to competition_path(@competition)
  end

  private

  def competition_params
    params.require(:competition).permit(:number_of_players, :category)
  end

  def sport_params
    params.require(:competition).permit(:sport)
  end

  def set_competition
    @competition = Competition.find(params[:id])
  end
end
