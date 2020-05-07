class FriendRequestsController < ApplicationController
  
  def index
  	@friend_requests = FriendRequest.where(to_user_id: current_user.id)
  	#ids = current_user.friend_requests.map(&:to_user_id)
  	#@users_requested = User.where("id IN (?)", ids)
  end

  def create
  	f = current_user.friend_requests.create!(to_user_id: params[:to_user_id])
  	redirect_to request.referrer || users_path
  end
end
