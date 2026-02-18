require 'test_helper'

class FakearticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fakearticle = fakearticles(:one)
  end

  test "should get index" do
    get fakearticles_url
    assert_response :success
  end

  test "should get new" do
    get new_fakearticle_url
    assert_response :success
  end

  test "should create fakearticle" do
    assert_difference('Fakearticle.count') do
      post fakearticles_url, params: { fakearticle: { authorname: @fakearticle.authorname, authorpic: @fakearticle.authorpic, authorpseudo: @fakearticle.authorpseudo, category: @fakearticle.category, content: @fakearticle.content, pic: @fakearticle.pic, title: @fakearticle.title } }
    end

    assert_redirected_to fakearticle_url(Fakearticle.last)
  end

  test "should show fakearticle" do
    get fakearticle_url(@fakearticle)
    assert_response :success
  end

  test "should get edit" do
    get edit_fakearticle_url(@fakearticle)
    assert_response :success
  end

  test "should update fakearticle" do
    patch fakearticle_url(@fakearticle), params: { fakearticle: { authorname: @fakearticle.authorname, authorpic: @fakearticle.authorpic, authorpseudo: @fakearticle.authorpseudo, category: @fakearticle.category, content: @fakearticle.content, pic: @fakearticle.pic, title: @fakearticle.title } }
    assert_redirected_to fakearticle_url(@fakearticle)
  end

  test "should destroy fakearticle" do
    assert_difference('Fakearticle.count', -1) do
      delete fakearticle_url(@fakearticle)
    end

    assert_redirected_to fakearticles_url
  end
end
