require 'test_helper'

class SecoundLoginControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get secound_login_new_url
    assert_response :success
  end

  test "should get create" do
    get secound_login_create_url
    assert_response :success
  end

end
