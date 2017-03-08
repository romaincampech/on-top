class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show, :update]

  def show
    @rounds = @competition.number_of_rounds(@competition.category)
    @chat_room = ChatRoom.includes(:messages).find_by(competition_id: @competition.id)
    @message = Message.new
    # @matches = Match.where(competition_id: @competition.id)
    if @competition.category == "Knockout"
      @competition.winner_match_assignment
    elsif @competition.category == "League"
      @competition_participants_by_points = @competition.competition_participants.order('points DESC')
    end
  end

  def new
    @competition = Competition.new
  end

  def create
    @competition = Competition.new(competition_params)
    @competition.creator = current_user
    @competition.save
    @competition.create_activity :create, owner: current_user
    @competition.create_matches
    players_ary = params[:competition][:user_ids].select { |id| !id.blank? }. map { |x| User.find(x) }
    @competition.add_players(players_ary)
    @competition.assign_matches if @competition.players.count == @competition.number_of_players
    @competition.new_chat
    @competition.save
    redirect_to competition_path(@competition)
  end

  # def update
  #   respond_to do |format|
  #   #   format.html { redirect_to competition_path(@match.competition_id) }
  #     format.js
  #   end
  # end

  private

  def competition_params
    params.require(:competition).permit(:category, :sport_id, :name, :number_of_players)
  end

  def set_competition
    @competition = Competition.find(params[:id])
  end
end
