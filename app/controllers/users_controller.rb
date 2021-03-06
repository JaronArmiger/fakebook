class UsersController < ApplicationController
    before_action :require_log_in
    
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@feed_items = @user.feed
	end
end
