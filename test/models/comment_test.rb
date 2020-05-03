require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
  	@comment = comments(:one)
  end

  test "should be valid" do
  	assert @comment.valid?
  end
end
