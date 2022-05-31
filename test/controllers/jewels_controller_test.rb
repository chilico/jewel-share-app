require "test_helper"

class JewelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jewels_index_url
    assert_response :success
  end

  test "should get show" do
    get jewels_show_url
    assert_response :success
  end

  test "should get new" do
    get jewels_new_url
    assert_response :success
  end

  test "should get edit" do
    get jewels_edit_url
    assert_response :success
  end
end
