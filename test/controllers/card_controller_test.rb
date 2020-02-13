require 'test_helper'

class CardControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get card_new_url
    assert_response :success
  end

  test "should get show" do
    get card_show_url
    assert_response :success
  end

  test "should get index" do
    get card_index_url
    assert_response :success
  end

  test "should get update" do
    get card_update_url
    assert_response :success
  end

  test "should get destroy" do
    get card_destroy_url
    assert_response :success
  end

end
