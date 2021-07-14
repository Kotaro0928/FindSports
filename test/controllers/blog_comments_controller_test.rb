require 'test_helper'

class BlogCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get blog_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get blog_comments_destroy_url
    assert_response :success
  end

end
