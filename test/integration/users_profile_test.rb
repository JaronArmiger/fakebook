require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  
  def setup
  	@user = users(:mathias)
  	log_in_as @user
  end

  test "profile display" do
  	get user_path(@user)
  	assert_template 'users/show'
  	assert_match @user.name, response.body
  	assert_match CGI.escapeHTML(@user.email), response.body
  	@user.feed.each do |post|
  		assert_match CGI.escapeHTML(post.content), response.body
  	end
  end
end
