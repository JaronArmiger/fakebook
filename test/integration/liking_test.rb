require 'test_helper'

class LikingTest < ActionDispatch::IntegrationTest
  def setup
  	@user = users(:mathias)
  	log_in_as @user
  end

  test "like and unlike post on profile page" do
  	get user_path(@user)
  	assert_template 'users/show'
  	post_id = @user.posts.first.id
  	assert_difference 'Like.count', 1 do
  		post likes_path, params: { liked_post_id: post_id,
  								   current_url: user_path(@user) }
  	end
  	assert_redirected_to user_path(@user)
  	follow_redirect!
  	assert_template 'users/show'
  	assert_match "unlike", response.body

  	like = @user.likes.find_by(liked_post_id: post_id)
  	assert_difference 'Like.count', -1 do
  		delete like_path(like), params: { liked_post_id: post_id,
  								   		  current_url: user_path(@user) }
  	end
  	assert_redirected_to user_path(@user)
  	follow_redirect!
  	assert_template 'users/show'
  	assert_match "like", response.body
  end
end
