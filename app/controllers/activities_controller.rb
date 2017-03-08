class ActivitiesController < ApplicationController

  def index
    @activities = policy_scope(PublicActivity::Activity.order('created_at DESC')).where(owner_id: current_user.friend_ids, owner_type: "User")
  end

end
