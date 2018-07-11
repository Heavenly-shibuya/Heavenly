require 'test_helper'

class CartsItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get carts_items_index_url
    assert_response :success
  end

  test "should get edit" do
    get carts_items_edit_url
    assert_response :success
  end

end
