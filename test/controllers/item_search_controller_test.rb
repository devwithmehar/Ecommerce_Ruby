require "test_helper"

class ItemSearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get item_search_index_url
    assert_response :success
  end
end
