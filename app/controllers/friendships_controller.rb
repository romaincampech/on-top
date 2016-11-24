class FriendshipsController < ApplicationController

  # def index
  #   @friends = current_user.friends
  # end

  def destroy
    @friendship = Friendship.find(params[:id])
    authorize @friendship
    @friendship.destroy
    redirect_to user_path(User.find(params[:user_id]))
  end


end
