class UsersController < ApplicationController
  before_action :find_user, only: [ :show ]
  before_action :session_conversations

  def show
    @weekly_all_tracker = @user.weekly_all_tracker
    @weekly_tennis_tracker = @user.weekly_tennis_tracker
    @weekly_squash_tracker = @user.weekly_squash_tracker
    @weekly_table_tennis_tracker = @user.weekly_table_tennis_tracker
  end

  def infos
    # todo get user from query name
    render json: { first_name: User.last.first_name }
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
