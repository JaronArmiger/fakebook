require 'test_helper'

class FeedTest < ActionDispatch::IntegrationTest
  
  def setup
  	@user = users(:mathias)
  	log_in_as @user
  end

  test "feed appears on home page" do
  	get root_path
  	assert_template 'static_pages/home'
  	@user.feed.each do |post|
  		assert_match CGI.escapeHTML(post.content), response.body
  	end
  end
end
