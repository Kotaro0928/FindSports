require 'test_helper'

class RecruitCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get recruit_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get recruit_comments_destroy_url
    assert_response :success
  end

end
