require 'test_helper'

class RecreationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recreation = recreations(:one)
  end

  test "should get index" do
    get recreations_url, as: :json
    assert_response :success
  end

  test "should create recreation" do
    assert_difference('Recreation.count') do
      post recreations_url, params: { recreation: { name: @recreation.name, path: @recreation.path } }, as: :json
    end

    assert_response 201
  end

  test "should show recreation" do
    get recreation_url(@recreation), as: :json
    assert_response :success
  end

  test "should update recreation" do
    patch recreation_url(@recreation), params: { recreation: { name: @recreation.name, path: @recreation.path } }, as: :json
    assert_response 200
  end

  test "should destroy recreation" do
    assert_difference('Recreation.count', -1) do
      delete recreation_url(@recreation), as: :json
    end

    assert_response 204
  end
end
