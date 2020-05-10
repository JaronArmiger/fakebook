require 'test_helper'

class PostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
  	@user = users(:mathias)
  end

  test "post creation interface" do
  	log_in_as @user
  	get home_path
  	assert_template 'static_pages/home'

  	# invalid submission
  	assert_no_difference 'Post.count' do
  		post posts_path params: { post: { content: " "} }
  	end

  	assert_select 'div#error_explanation'

  	#valid submission
    image = fixture_file_upload('test/fixtures/juliette.jpg')
  	assert_difference 'Post.count', 1 do
  		post posts_path, params: { post: { content: "ca veux dire?", image: image } }
  	end

  end
end
