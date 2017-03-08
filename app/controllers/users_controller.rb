class UsersController < ApplicationController
  before_action :find_user, only: [ :show ]

  def show
  end

  def infos
    # todo get user from query name
    render json: { first_name: User.last.first_name }
  end

  private

  def find_user
    @user = User.friendly.find(params[:id])
    if request.path != user_path(@user)
      redirect_to @user, status: :moved_permanently
    end
  end
end
