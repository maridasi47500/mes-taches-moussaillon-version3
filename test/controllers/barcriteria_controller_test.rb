require 'test_helper'

class BarcriteriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barcriterium = barcriteria(:one)
  end

  test "should get index" do
    get barcriteria_url
    assert_response :success
  end

  test "should get new" do
    get new_barcriterium_url
    assert_response :success
  end

  test "should create barcriterium" do
    assert_difference('Barcriterium.count') do
      post barcriteria_url, params: { barcriterium: { description: @barcriterium.description, gooduser_id: @barcriterium.gooduser_id, musicalscore_id: @barcriterium.musicalscore_id } }
    end

    assert_redirected_to barcriterium_url(Barcriterium.last)
  end

  test "should show barcriterium" do
    get barcriterium_url(@barcriterium)
    assert_response :success
  end

  test "should get edit" do
    get edit_barcriterium_url(@barcriterium)
    assert_response :success
  end

  test "should update barcriterium" do
    patch barcriterium_url(@barcriterium), params: { barcriterium: { description: @barcriterium.description, gooduser_id: @barcriterium.gooduser_id, musicalscore_id: @barcriterium.musicalscore_id } }
    assert_redirected_to barcriterium_url(@barcriterium)
  end

  test "should destroy barcriterium" do
    assert_difference('Barcriterium.count', -1) do
      delete barcriterium_url(@barcriterium)
    end

    assert_redirected_to barcriteria_url
  end
end
