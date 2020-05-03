require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
  	@post = posts(:one)
  end

  test "should redirect create when not logged in" do
  end
end
