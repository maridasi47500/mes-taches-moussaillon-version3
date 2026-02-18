require 'test_helper'

class MoviescenesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @moviescene = moviescenes(:one)
  end

  test "should get index" do
    get moviescenes_url
    assert_response :success
  end

  test "should get new" do
    get new_moviescene_url
    assert_response :success
  end

  test "should create moviescene" do
    assert_difference('Moviescene.count') do
      post moviescenes_url, params: { moviescene: { description: @moviescene.description, title: @moviescene.title } }
    end

    assert_redirected_to moviescene_url(Moviescene.last)
  end

  test "should show moviescene" do
    get moviescene_url(@moviescene)
    assert_response :success
  end

  test "should get edit" do
    get edit_moviescene_url(@moviescene)
    assert_response :success
  end

  test "should update moviescene" do
    patch moviescene_url(@moviescene), params: { moviescene: { description: @moviescene.description, title: @moviescene.title } }
    assert_redirected_to moviescene_url(@moviescene)
  end

  test "should destroy moviescene" do
    assert_difference('Moviescene.count', -1) do
      delete moviescene_url(@moviescene)
    end

    assert_redirected_to moviescenes_url
  end
end
