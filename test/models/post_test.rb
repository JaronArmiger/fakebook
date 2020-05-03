require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
  	@post = posts(:one)
  end

  test "should be valid" do
  	assert @post.valid?
  end

  test "content should be less than 1000 characters" do
  	@post.content = "y" * 1001
  	assert_not @post.valid?
  end
end
