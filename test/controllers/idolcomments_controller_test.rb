require 'test_helper'

class IdolcommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @idolcomment = idolcomments(:one)
  end

  test "should get index" do
    get idolcomments_url
    assert_response :success
  end

  test "should get new" do
    get new_idolcomment_url
    assert_response :success
  end

  test "should create idolcomment" do
    assert_difference('Idolcomment.count') do
      post idolcomments_url, params: { idolcomment: { alias_id: @idolcomment.alias_id, content_de: @idolcomment.content_de, content_en: @idolcomment.content_en, content_fr: @idolcomment.content_fr, tvserieshaveactor_id: @idolcomment.tvserieshaveactor_id } }
    end

    assert_redirected_to idolcomment_url(Idolcomment.last)
  end

  test "should show idolcomment" do
    get idolcomment_url(@idolcomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_idolcomment_url(@idolcomment)
    assert_response :success
  end

  test "should update idolcomment" do
    patch idolcomment_url(@idolcomment), params: { idolcomment: { alias_id: @idolcomment.alias_id, content_de: @idolcomment.content_de, content_en: @idolcomment.content_en, content_fr: @idolcomment.content_fr, tvserieshaveactor_id: @idolcomment.tvserieshaveactor_id } }
    assert_redirected_to idolcomment_url(@idolcomment)
  end

  test "should destroy idolcomment" do
    assert_difference('Idolcomment.count', -1) do
      delete idolcomment_url(@idolcomment)
    end

    assert_redirected_to idolcomments_url
  end
end
