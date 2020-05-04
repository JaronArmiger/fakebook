require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
  	@user = users(:mathias)
  end

  test "unsuccessful edit" do
  	log_in_as @user
  	get edit_user_path @user
  	assert_template 'users/edit'
  	patch user_path, params: { user: { name: "", 
  									   email: "", 
  									   password: "merde" } }
  	assert_template 'users/edit'
  	assert_select 'div.alert', text: "the form contains 2 errors"
  end

  test "successful edit" do
  end
end
