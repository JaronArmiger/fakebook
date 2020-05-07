class LikesController < ApplicationController
	before_action :require_log_in

	def create
		post = Post.find(params[:liked_post_id])
		current_user.like(post)
		redirect_to params[:current_url]
	end

	def destroy
		post = Post.find(params[:liked_post_id])
		current_user.unlike(post)
		redirect_to params[:current_url]
	end
end
