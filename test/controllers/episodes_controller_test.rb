require 'test_helper'

class EpisodesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get episodes_new_url
    assert_response :success
  end

  test "should get create" do
    get episodes_create_url
    assert_response :success
  end

  test "should get show" do
    get episodes_show_url
    assert_response :success
  end

end
