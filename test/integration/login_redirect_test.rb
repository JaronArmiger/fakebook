require 'test_helper'

class LoginRedirectTest < ActionDispatch::IntegrationTest
  
  def setup
  	@user = users(:mathias)
  end

  test "should require login, then redirect to correct page" do
  	get user_path(@user)
  	assert_redirected_to new_user_session_path
  	log_in_as @user
  	assert_redirected_to user_path(@user)
  end
end
