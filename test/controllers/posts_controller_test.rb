require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
  	@post = posts(:one)
  end

  test "should redirect create when not logged in" do
  	assert_no_difference 'Post.count' do
  		post posts_path params: { post: { content: "faut pas subir"} }
  	end
  	assert_redirected_to new_user_session_path
  end

  test "should create properly if user logged in" do
  	log_in_as(users(:mathias))
  	assert_difference 'Post.count', 1 do
  		post posts_path params: { post: { content: "faut pas subir" } }
  	end
  end

  test "should redirect destroy when not logged in" do
  	assert_no_difference 'Post.count' do
  		delete post_path(@post)
  	end
  	assert_redirected_to new_user_session_path
  end
  

end
