require 'test_helper'

class Owner::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get owner_items_index_url
    assert_response :success
  end

end
