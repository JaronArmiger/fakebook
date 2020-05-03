require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
  	@comment = comments(:one)
  end

  test "should be valid" do
  	assert @comment.valid?
  end

  test "content should be less than 100 characters" do
  	@comment.content = "q" * 101
  	assert_not @comment.valid?
  end
end
