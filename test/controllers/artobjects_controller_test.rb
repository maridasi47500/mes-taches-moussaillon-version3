require 'test_helper'

class ArtobjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artobject = artobjects(:one)
  end

  test "should get index" do
    get artobjects_url
    assert_response :success
  end

  test "should get new" do
    get new_artobject_url
    assert_response :success
  end

  test "should create artobject" do
    assert_difference('Artobject.count') do
      post artobjects_url, params: { artobject: { image: @artobject.image, name: @artobject.name } }
    end

    assert_redirected_to artobject_url(Artobject.last)
  end

  test "should show artobject" do
    get artobject_url(@artobject)
    assert_response :success
  end

  test "should get edit" do
    get edit_artobject_url(@artobject)
    assert_response :success
  end

  test "should update artobject" do
    patch artobject_url(@artobject), params: { artobject: { image: @artobject.image, name: @artobject.name } }
    assert_redirected_to artobject_url(@artobject)
  end

  test "should destroy artobject" do
    assert_difference('Artobject.count', -1) do
      delete artobject_url(@artobject)
    end

    assert_redirected_to artobjects_url
  end
end
