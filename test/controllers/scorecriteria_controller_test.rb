require 'test_helper'

class ScorecriteriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scorecriterium = scorecriteria(:one)
  end

  test "should get index" do
    get scorecriteria_url
    assert_response :success
  end

  test "should get new" do
    get new_scorecriterium_url
    assert_response :success
  end

  test "should create scorecriterium" do
    assert_difference('Scorecriterium.count') do
      post scorecriteria_url, params: { scorecriterium: { description: @scorecriterium.description, gooduser_id: @scorecriterium.gooduser_id, musicalscore_id: @scorecriterium.musicalscore_id } }
    end

    assert_redirected_to scorecriterium_url(Scorecriterium.last)
  end

  test "should show scorecriterium" do
    get scorecriterium_url(@scorecriterium)
    assert_response :success
  end

  test "should get edit" do
    get edit_scorecriterium_url(@scorecriterium)
    assert_response :success
  end

  test "should update scorecriterium" do
    patch scorecriterium_url(@scorecriterium), params: { scorecriterium: { description: @scorecriterium.description, gooduser_id: @scorecriterium.gooduser_id, musicalscore_id: @scorecriterium.musicalscore_id } }
    assert_redirected_to scorecriterium_url(@scorecriterium)
  end

  test "should destroy scorecriterium" do
    assert_difference('Scorecriterium.count', -1) do
      delete scorecriterium_url(@scorecriterium)
    end

    assert_redirected_to scorecriteria_url
  end
end
