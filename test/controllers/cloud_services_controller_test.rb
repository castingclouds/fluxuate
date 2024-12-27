require "test_helper"

class CloudServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cloud_services_index_url
    assert_response :success
  end

  test "should get show" do
    get cloud_services_show_url
    assert_response :success
  end

  test "should get new" do
    get cloud_services_new_url
    assert_response :success
  end

  test "should get edit" do
    get cloud_services_edit_url
    assert_response :success
  end

  test "should get create" do
    get cloud_services_create_url
    assert_response :success
  end

  test "should get update" do
    get cloud_services_update_url
    assert_response :success
  end

  test "should get destroy" do
    get cloud_services_destroy_url
    assert_response :success
  end
end
