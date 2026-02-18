require 'test_helper'

class AttitudephotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attitudephoto = attitudephotos(:one)
  end

  test "should get index" do
    get attitudephotos_url
    assert_response :success
  end

  test "should get new" do
    get new_attitudephoto_url
    assert_response :success
  end

  test "should create attitudephoto" do
    assert_difference('Attitudephoto.count') do
      post attitudephotos_url, params: { attitudephoto: { end_at: @attitudephoto.end_at, start_at: @attitudephoto.start_at, title_de: @attitudephoto.title_de, title_en: @attitudephoto.title_en, title_fr: @attitudephoto.title_fr } }
    end

    assert_redirected_to attitudephoto_url(Attitudephoto.last)
  end

  test "should show attitudephoto" do
    get attitudephoto_url(@attitudephoto)
    assert_response :success
  end

  test "should get edit" do
    get edit_attitudephoto_url(@attitudephoto)
    assert_response :success
  end

  test "should update attitudephoto" do
    patch attitudephoto_url(@attitudephoto), params: { attitudephoto: { end_at: @attitudephoto.end_at, start_at: @attitudephoto.start_at, title_de: @attitudephoto.title_de, title_en: @attitudephoto.title_en, title_fr: @attitudephoto.title_fr } }
    assert_redirected_to attitudephoto_url(@attitudephoto)
  end

  test "should destroy attitudephoto" do
    assert_difference('Attitudephoto.count', -1) do
      delete attitudephoto_url(@attitudephoto)
    end

    assert_redirected_to attitudephotos_url
  end
end
