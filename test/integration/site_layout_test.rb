require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
  	@user = users(:mathias)
  end

  test "layout links if no one logged in" do
  	get root_path
  	assert_redirected_to new_user_session_path
  	follow_redirect!
  	assert_select 'a[href=?]', new_user_session_path
  	assert_select 'a[href=?]', new_user_registration_path
  end

  test "layout links if user logged in" do
  	log_in_as @user
  	get root_path
  	assert_match CGI.escapeHTML(@user.email), response.body
  	assert_select 'a[href=?]', destroy_user_session_path
  	assert_select 'a[href=?]', user_path(@user)
  	assert_select 'a[href=?]', home_path
  end
end
