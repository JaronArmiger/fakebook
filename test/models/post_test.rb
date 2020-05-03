require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
  	@post = posts(:one)
  end

  test "should be valid" do
  	assert @post.valid?
  end
end
