class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show]


  def show
    @rounds = @competition.number_of_rounds(@competition.category)
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
    @competition.create_matches(params[:competition][:category])
    # insert method to population competition with users(player:true) selected from form
    #@competition.add_players(TODO INSERT FORM OUTPUT HERE AND ADAPT METHOD IF OUTPUT IS NOT ARRAY OF USER INSTANCES)
    @competition.assign_matches
    redirect_to competition_path(@competition)
  end

  private

  def competition_params
    params.require(:competition).permit(:number_of_players, :category, :sport_id, :name)
  end

  def set_competition
    @competition = Competition.find(params[:id])
    authorize(@competition)
  end
end
