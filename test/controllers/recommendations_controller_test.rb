require 'test_helper'

class RecommendationsControllerTest < ActionDispatch::IntegrationTest
  test "should get pages" do
    get recommendations_pages_url
    assert_response :success
  end

  test "should get display" do
    get recommendations_display_url
    assert_response :success
  end

end
