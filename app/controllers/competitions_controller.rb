class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show]

  def show
    @rounds = @competition.number_of_rounds(@competition.category)
  end

  def new
    @competition = Competition.new
  end

  def create
    @competition = Competition.new(competition_params)
    @competition.creator = current_user
    @competition.save
    @competition.create_matches(params[:competition][:category])
    redirect_to competition_path(@competition)
  end

  private

  def competition_params
    params.require(:competition).permit(:number_of_players, :category, :sport_id, :name)
  end

  def set_competition
    @competition = Competition.find(params[:id])
  end
end
