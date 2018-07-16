require 'test_helper'

class Admin::DeliveryAddresssControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_delivery_addresss_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_delivery_addresss_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_delivery_addresss_edit_url
    assert_response :success
  end

end
