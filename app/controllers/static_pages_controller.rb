class StaticPagesController < ApplicationController
	def home
		@post = current_user.posts.build
		@feed_items = current_user.feed
	end
end
