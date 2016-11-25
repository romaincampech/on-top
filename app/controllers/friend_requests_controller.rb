class FriendRequestsController < ApplicationController
  before_action :set_friend_request, except: [ :index, :create ]

  def index
    @incoming = FriendRequest.where(friend: current_user)
    @outgoing = current_user.friend_requests
  end

  def create
    friend = User.find(params[:user_id])
    @friend_request = current_user.friend_requests.new(friend: friend)
    @friend_request.save
    authorize(@friend_request)

    # redirect_to user_path(friend)
  end

  def update
    @friend_request.accept
  end

  def destroy
    @friend_request.destroy
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end
