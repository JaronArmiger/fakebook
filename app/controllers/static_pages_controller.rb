class StaticPagesController < ApplicationController
	before_action :require_log_in

	def home
		@post = current_user.posts.build
		@feed_items = current_user.feed
	end
end
