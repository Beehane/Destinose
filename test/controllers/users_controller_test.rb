require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get facebook" do
    get users_facebook_url
    assert_response :success
  end

end
