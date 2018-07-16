require 'test_helper'

class Admin::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_reviews_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_reviews_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_reviews_new_url
    assert_response :success
  end

end
