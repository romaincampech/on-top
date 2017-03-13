class TeamsController < ApplicationController
  before_action :set_team, only: [:show]
  skip_before_action :authenticate_user!, only: [ :show ]

  def new
    @team = Team.new
  end

  def show
  end

  def create
    @team = Team.new(team_params)
    @team.captain = current_user
    @team.save
    TeamMembership.create!(user: current_user, team: @team, captain: true)
    # @team.create_activity :create, owner: current_user
    users_ary = params[:team][:user_ids].select { |id| !id.blank? }. map { |x| User.find(x) }
    @team.add_users(users_ary)
    redirect_to team_path(@team)
  end

  private

  def team_params
    params.require(:team).permit(:city, :name, :sport_id, :profile_picture)
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
