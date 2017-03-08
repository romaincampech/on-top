class FriendshipsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @friends = policy_scope(@user.friends)
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to user_path(User.find(params[:user_id]))
  end
end
