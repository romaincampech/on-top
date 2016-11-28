class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show]

  def show
    @rounds = @competition.number_of_rounds(@competition.category)
    @chat_room = ChatRoom.includes(:messages).find_by(competition_id: @competition.id)
    @message = Message.new
    @competition.winner_match_assignment
  end

  def new
    @competition = Competition.new
    authorize @competition
  end

  def create
    @competition = Competition.new(competition_params)
    authorize @competition
    @competition.creator = current_user
    if @competition.team_competition
      @competition.number_of_players = params[:competition][:number_of_teams]
    else
      @competition.number_of_players = params[:competition][:number_of_players]
    end
    @competition.save
    @competition.create_activity :create, owner: current_user
    @competition.create_matches(params[:competition][:category])
    players_ary = params[:competition][:user_ids].select { |id| !id.blank? }. map { |x| User.find(x) }
    @competition.add_players(players_ary)
    @competition.assign_matches if @competition.players.count == @competition.number_of_players
    @competition.new_chat
    redirect_to competition_path(@competition)
  end

  private

  def competition_params
    params.require(:competition).permit(:category, :sport_id, :name, :team_competition)
  end

  def set_competition
    @competition = Competition.find(params[:id])
    authorize(@competition)
  end
end
