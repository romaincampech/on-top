class FriendRequestsController < ApplicationController
  before_action :set_friend_request, except: [ :index, :create ]

  def index
    @incoming = FriendRequest.where(friend: current_user)
    @outgoing = current_user.friend_requests
  end

  def create
    friend = User.find(params[:user_id])
    @friend_request = current_user.pending_friends_requests.new(friend: friend)
    @friend_request.save
    redirect_to :back
  end

  def update
    @friend_request.accept

    redirect_to user_path(@friend_request.friend)
  end

  def destroy
    @friend_request.destroy
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end
