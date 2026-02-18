require 'test_helper'

class ReactionsTextsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reactions_text = reactions_texts(:one)
  end

  test "should get index" do
    get reactions_texts_url
    assert_response :success
  end

  test "should get new" do
    get new_reactions_text_url
    assert_response :success
  end

  test "should create reactions_text" do
    assert_difference('ReactionsText.count') do
      post reactions_texts_url, params: { reactions_text: { name: @reactions_text.name } }
    end

    assert_redirected_to reactions_text_url(ReactionsText.last)
  end

  test "should show reactions_text" do
    get reactions_text_url(@reactions_text)
    assert_response :success
  end

  test "should get edit" do
    get edit_reactions_text_url(@reactions_text)
    assert_response :success
  end

  test "should update reactions_text" do
    patch reactions_text_url(@reactions_text), params: { reactions_text: { name: @reactions_text.name } }
    assert_redirected_to reactions_text_url(@reactions_text)
  end

  test "should destroy reactions_text" do
    assert_difference('ReactionsText.count', -1) do
      delete reactions_text_url(@reactions_text)
    end

    assert_redirected_to reactions_texts_url
  end
end
