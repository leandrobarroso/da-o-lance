require 'test_helper'

class BidsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bids_index_url
    assert_response :success
  end

  test "should get show" do
    get bids_show_url
    assert_response :success
  end

end
