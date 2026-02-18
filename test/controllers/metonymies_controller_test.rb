require 'test_helper'

class MetonymiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @metonymy = metonymies(:one)
  end

  test "should get index" do
    get metonymies_url
    assert_response :success
  end

  test "should get new" do
    get new_metonymy_url
    assert_response :success
  end

  test "should create metonymy" do
    assert_difference('Metonymy.count') do
      post metonymies_url, params: { metonymy: { name: @metonymy.name, post_id: @metonymy.post_id, thing_id: @metonymy.thing_id } }
    end

    assert_redirected_to metonymy_url(Metonymy.last)
  end

  test "should show metonymy" do
    get metonymy_url(@metonymy)
    assert_response :success
  end

  test "should get edit" do
    get edit_metonymy_url(@metonymy)
    assert_response :success
  end

  test "should update metonymy" do
    patch metonymy_url(@metonymy), params: { metonymy: { name: @metonymy.name, post_id: @metonymy.post_id, thing_id: @metonymy.thing_id } }
    assert_redirected_to metonymy_url(@metonymy)
  end

  test "should destroy metonymy" do
    assert_difference('Metonymy.count', -1) do
      delete metonymy_url(@metonymy)
    end

    assert_redirected_to metonymies_url
  end
end
