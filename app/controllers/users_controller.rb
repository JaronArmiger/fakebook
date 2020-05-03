class UsersController < ApplicationController
    before_action :require_log_in
    
	def index
	end

	def show
		@user = User.find(params[:id])
	end
end
