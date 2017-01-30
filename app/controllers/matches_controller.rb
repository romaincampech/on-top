class MatchesController < ApplicationController
  before_action :set_match, except: [:index]

  def index
    @matches = Match.all
  end

  def edit
  end

  def update
    @match.set_build_score(params)
    @winner = @match.assign_winner(@match.score)
    @competition = @match.competition
    @match.save
    if @match.competition.category == "League"
      @match.league_points
    else
      @match.last_match_knockout(@competition)
    end
    respond_to do |format|
      format.html { redirect_to competition_path(@match.competition_id) }
      format.js # { :location => competition_path(@match.competition_id), method: :patch }
    end
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
