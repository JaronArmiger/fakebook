require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
  	@user = users(:mathias)
  	log_in_as @user
  end

  test "unsuccessful edit" do
  	get edit_user_path @user
  	assert_template 'users/edit'
  	patch user_path, params: { user: { name: "", 
  									   email: "", 
  									   password: "merde" } }
  	assert_template 'users/edit'
  	assert_select 'div.alert', text: "the form contains 3 errors"
  end

  test "successful edit" do
  	get edit_user_path @user
  	assert_template 'users/edit'
  	patch user_path, params: { user: { name: "Arlette", 
  									   email: "arlette@ask.fr", 
  									   password: "cettemerde" } }
  	assert_template 'users/edit'
  end
end
