require 'test_helper'

class FacebookSignInTest < ActionDispatch::IntegrationTest
  test "successful sign in with facebook" do
  	OmniAuth.config.test_mode = true
  	OmniAuth.config.add_mock(:facebook, {uid: '123545'})
  	Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  	Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
  	puts ENV['omniauth.auth']
  	puts ENV["devise.mapping"]
  	
  end
end
