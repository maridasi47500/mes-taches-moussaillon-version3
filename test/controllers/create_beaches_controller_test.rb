require 'test_helper'

class CreateBeachesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @create_beach = create_beaches(:one)
  end

  test "should get index" do
    get create_beaches_url
    assert_response :success
  end

  test "should get new" do
    get new_create_beach_url
    assert_response :success
  end

  test "should create create_beach" do
    assert_difference('CreateBeach.count') do
      post create_beaches_url, params: { create_beach: { address_id: @create_beach.address_id, name: @create_beach.name } }
    end

    assert_redirected_to create_beach_url(CreateBeach.last)
  end

  test "should show create_beach" do
    get create_beach_url(@create_beach)
    assert_response :success
  end

  test "should get edit" do
    get edit_create_beach_url(@create_beach)
    assert_response :success
  end

  test "should update create_beach" do
    patch create_beach_url(@create_beach), params: { create_beach: { address_id: @create_beach.address_id, name: @create_beach.name } }
    assert_redirected_to create_beach_url(@create_beach)
  end

  test "should destroy create_beach" do
    assert_difference('CreateBeach.count', -1) do
      delete create_beach_url(@create_beach)
    end

    assert_redirected_to create_beaches_url
  end
end
