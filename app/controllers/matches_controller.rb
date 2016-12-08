class MatchesController < ApplicationController
  before_action :set_match

  def edit
  end

  def update
    @match.set_build_score(params)
    @winner = @match.assign_winner(@match.score)
    @competition = @match.competition
    @match.save
    @match.league_points
    @match.last_match_knockout(@competition)
    redirect_to competition_path(@match.competition_id)
  end

  def show
  end

  private

  def set_match
    @match = Match.find(params[:id])
    authorize @match
  end

  def match_params
    params.require(:match).permit(:id)
  end
end
