require 'test_helper'

class WinningattitudesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @winningattitude = winningattitudes(:one)
  end

  test "should get index" do
    get winningattitudes_url
    assert_response :success
  end

  test "should get new" do
    get new_winningattitude_url
    assert_response :success
  end

  test "should create winningattitude" do
    assert_difference('Winningattitude.count') do
      post winningattitudes_url, params: { winningattitude: { content_de: @winningattitude.content_de, content_en: @winningattitude.content_en, content_fr: @winningattitude.content_fr } }
    end

    assert_redirected_to winningattitude_url(Winningattitude.last)
  end

  test "should show winningattitude" do
    get winningattitude_url(@winningattitude)
    assert_response :success
  end

  test "should get edit" do
    get edit_winningattitude_url(@winningattitude)
    assert_response :success
  end

  test "should update winningattitude" do
    patch winningattitude_url(@winningattitude), params: { winningattitude: { content_de: @winningattitude.content_de, content_en: @winningattitude.content_en, content_fr: @winningattitude.content_fr } }
    assert_redirected_to winningattitude_url(@winningattitude)
  end

  test "should destroy winningattitude" do
    assert_difference('Winningattitude.count', -1) do
      delete winningattitude_url(@winningattitude)
    end

    assert_redirected_to winningattitudes_url
  end
end
