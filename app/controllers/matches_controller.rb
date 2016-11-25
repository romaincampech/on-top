class MatchesController < ApplicationController
  before_action :set_match

  def edit
  end

  def update
    @match.build_score(params)
    @winner = @match.assign_winner(@match.score)
    @match.save
    binding.pry
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
