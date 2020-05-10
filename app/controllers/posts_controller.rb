class PostsController < ApplicationController
	before_action :require_log_in

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Post cree"
			redirect_to root_url
		else
			@feed_items = current_user.feed
			render 'static_pages/home'
		end
	end

	def destroy
	end

	private

	  def post_params
	  	params.require(:post).permit(:content, :image)
	  end
end
