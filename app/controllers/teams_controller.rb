class TeamsController < ApplicationController
  def new
    @team = Team.new
    authorize @team
  end

  def create
    @team = Team.new(team_params)
    authorize @team
    @team.captain = current_user
    @team.save
    TeamMembership.create!(user: current_user, team: @team, captain: true)
    # @team.create_activity :create, owner: current_user
    users_ary = params[:team][:user_ids].select { |id| !id.blank? }. map { |x| User.find(x) }
    @team.add_users(users_ary)
    @team.new_chat
  end

  private

  def team_params
    params.require(:team).permit(:city, :name, :sport_id)
  end
end
