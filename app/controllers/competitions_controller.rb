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
    @competition.save
    @competition.create_matches
    # insert method to population competition with users(player:true) selected from form
    #@competition.add_players(TODO INSERT FORM OUTPUT HERE AND ADAPT METHOD IF OUTPUT IS NOT ARRAY OF USER INSTANCES)
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
  end
end
