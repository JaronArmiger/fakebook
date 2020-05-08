require 'test_helper'

class FriendRequestingTest < ActionDispatch::IntegrationTest
  def setup
  	@user = users(:mathias)
  	@other_user = users(:andrea)
  	log_in_as @user
  end

  test "friend requesting" do
  	assert_not @user.friends.include?(@other_user)
  	assert_not @other_user.friends.include?(@user)
  	get users_path
  	assert_template 'users/index'
  	assert_select 'input[value=?]', "friend +1"
  	assert_difference 'FriendRequest.count', 1 do
  		post friend_requests_path, params: { to_user_id: @other_user.id }
  	end
  	assert_redirected_to users_path
  	follow_redirect!
  	assert_select 'span', "demande d'ami envoyee"
  	log_out
  	# make sure I'm logged out by checking I get redirected
  	get users_path
  	assert_redirected_to new_user_session_path
  	log_in_as @other_user
  	assert_difference '@user.friends.count', 1 do
  		post friendships_path, params: { user_id: @user.id }
  	end
  	assert @user.friends.include?(@other_user)
  	assert @other_user.friends.include?(@user)
  end
end
