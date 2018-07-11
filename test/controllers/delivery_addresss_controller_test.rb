require 'test_helper'

class DeliveryAddresssControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get delivery_addresss_new_url
    assert_response :success
  end

end
