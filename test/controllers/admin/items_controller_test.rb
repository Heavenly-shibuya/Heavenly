require 'test_helper'

class Admin::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_items_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_items_edit_url
    assert_response :success
  end

  test "should get new" do
    get admin_items_new_url
    assert_response :success
  end

  test "should get stock" do
    get admin_items_stock_url
    assert_response :success
  end

  test "should get stock_edit" do
    get admin_items_stock_edit_url
    assert_response :success
  end

end
