require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
  	@user = users(:mathias)
  	log_in_as @user
  end

  test "unsuccessful edit" do
  	get edit_user_registration_path @user
  	put users_path, params: { user: { name: "", 
  									   email: ""} }
  	assert_select 'div#error_explanation'
  end

  test "successful edit" do
  	get edit_user_registration_path @user
  	put users_path, params: { user: { name: "Arlette", 
  									   email: "arlette@ask.fr" } }
  end
end
