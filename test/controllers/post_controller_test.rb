require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_index_url
    assert_response :success
  end

  test "should get create" do
    get post_create_url
    assert_response :success
  end

  test "should get new" do
    get post_new_url
    assert_response :success
  end

  test "should get edit" do
    get post_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get post_destroy_url
    assert_response :success
  end

end
