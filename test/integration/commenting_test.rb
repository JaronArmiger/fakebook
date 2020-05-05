require 'test_helper'

class CommentingTest < ActionDispatch::IntegrationTest
  
  def setup
  	@user = users(:mathias)
  	log_in_as @user
  	@post = posts(:one)
  end

  test "comment and then delete comment on home page" do
  	get home_path
  	assert_template 'static_pages/home'
  	content = 'prends la porte'
  	assert_difference 'Comment.count', 1 do
  		post comments_path, params: { current_url: home_path,
  									  comment: { content: content,
  												 post_id: @post.id } }
  	end
  	assert_redirected_to home_path
  	follow_redirect!
  	assert_template 'static_pages/home'
  	assert_match content, response.body
  	# delete comment
  	comment = @user.comments.find_by(post_id: @post.id)
  	assert_difference 'Comment.count', -1 do
  		delete comment_path(comment)
  	end
  	assert_redirected_to home_path
  	follow_redirect!
  	assert_template 'static_pages/home'
  	assert_match content, response.body, count: 0
  end
end
