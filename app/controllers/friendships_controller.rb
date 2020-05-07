class FriendshipsController < ApplicationController
	before_action :require_log_in

	def create
		first_id = current_user.id
		second_id = params[:user_id]

		user = User.find(second_id)
		current_user.friends << user

		FriendRequest.cleanup(first_id, second_id)

		flash[:success] = "tu es maintenant amie avec #{user.name}"
		redirect_to user_path(user)
	end

	def destroy
		
	end
end
