require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get body" do
    get comments_body_url
    assert_response :success
  end

end
