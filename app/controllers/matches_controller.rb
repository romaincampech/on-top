class MatchesController < ApplicationController
  before_action :set_match, except: [:index]

  def index
    @matches = Match.all
  end

  def edit
  end

  def update
    if @match.competition.category == "League"
      @match.set_build_score(params["score_params"])
      @winner = @match.assign_winner(@match.score)
      @competition = @match.competition
      # @match.save
      # @match.played?
      @match.league_points
      @match.save
      @league_table_data = @competition.league_table_data(@competition.competition_participants_by_points)
      respond_to do |format|
        format.json { render template: 'competitions/show', status: :created }
      end
    else
      @match.set_build_score(params["score_params"])
      @winner = @match.assign_winner(@match.score)
      @competition = @match.competition
      @match.save
      @match.last_match_knockout(@competition)
      redirect_to competition_path(@competition)
    end
  end

  def update_mistake
    #find previous winner, minus the points, save new score, add points.
  end

  def show
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:id, :score_params)
  end
end
