require 'test_helper'

class AuctionProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get auction_products_new_url
    assert_response :success
  end

  test "should get create" do
    get auction_products_create_url
    assert_response :success
  end

end
