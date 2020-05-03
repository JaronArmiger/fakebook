require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
  	@like = likes(:one)
  end

  test "should be valid" do
  	assert @like.valid?
  end

  test "should require liker_id" do
  	@like.liker_id = nil
  	assert_not @like.valid?
  end

  test "should require liked_post_id" do
    @like.liked_post_id = nil
    assert_not @like.valid?
  end
end
