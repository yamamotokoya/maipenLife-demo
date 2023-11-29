require 'test_helper'

class StreamersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get streamers_new_url
    assert_response :success
  end

  test "should get create" do
    get streamers_create_url
    assert_response :success
  end

end
