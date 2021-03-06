require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  def setup
  	@pic = fixture_file_upload('test/fixtures/juliette.jpg')
  	@sign_up_params = { user: {
			 name: "Juliette Binoche",
			 email: "juliette@star.fr",
			 password: "password",
			 password_confirmation: "password",
			 profile_picture: @pic
		} }
    ActionMailer::Base.deliveries.clear
  end


  test "sign up with a profile picture" do
  	assert_difference 'User.count', 1 do
  		post user_registration_path, params: @sign_up_params
  	end
  	@user = User.find_by(name: "Juliette Binoche")
  	assert @user.profile_picture.attached?
    assert_equal 1, ActionMailer::Base.deliveries.size
  end
end
