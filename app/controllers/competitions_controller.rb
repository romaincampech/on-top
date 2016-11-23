class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show]


  def show
  end

  def new
    @competition = Competition.new
    authorize @competition
  end

  def create
    @competition = Competition.new(competition_params)
    authorize @competition
    @competition.creator = current_user
    @competition.save
    @competition.create_matches
    @competition.assign_matches
    redirect_to competition_path(@competition)
  end

  private

  def competition_params
    params.require(:competition).permit(:number_of_players, :category, :sport_id)
  end

  def sport_params
    params.require(:competition).permit(:sport)
  end

  def set_competition
    @competition = Competition.find(params[:id])
    authorize(@competition)
  end
end
