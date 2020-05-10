require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  #include Devise::Test::ControllerHelpers

  test "sign up email" do
  	user = users(:mathias)
  	#sign_in :user, user
  	mail = UserMailer.sign_up_email(user)
  	assert_equal "merci pour s'inscrire", mail.subject
  	assert_equal [user.email], mail.to
  	assert_equal ["leconnard@ask.fr"], mail.from
  	assert_match user.name, mail.body.encoded
  end
end
