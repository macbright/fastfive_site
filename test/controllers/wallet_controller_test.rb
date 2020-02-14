require 'test_helper'

class WalletControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get wallet_new_url
    assert_response :success
  end

end
