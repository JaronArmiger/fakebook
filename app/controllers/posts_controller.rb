class PostsController < ApplicationController
	before_action :require_log_in

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Post cree"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	private

	  def post_params
	  	params.require(:post).permit(:content)
	  end
end
