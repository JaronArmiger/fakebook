require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "home page unavailable if user not logged in" do
  	get home_path
  	assert_redirected_to new_user_session_path
  end

  test "should get home if user logged in" do
  	log_in_as users(:mathias)
  	get home_path
  	assert_response :success
  	assert_select "form[class=?]", "post_form"
  	assert_select "li"
  end
end
