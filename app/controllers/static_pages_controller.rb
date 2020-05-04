class StaticPagesController < ApplicationController
	before_action :require_log_in

	def home
		puts ""
		puts 'FUCK'
		puts ""
		puts @feed_items
		puts ""
		@post = current_user.posts.build

		@feed_items = current_user.feed
	end
end
