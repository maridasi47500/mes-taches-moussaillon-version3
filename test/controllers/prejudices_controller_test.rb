require 'test_helper'

class PrejudicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prejudice = prejudices(:one)
  end

  test "should get index" do
    get prejudices_url
    assert_response :success
  end

  test "should get new" do
    get new_prejudice_url
    assert_response :success
  end

  test "should create prejudice" do
    assert_difference('Prejudice.count') do
      post prejudices_url, params: { prejudice: { content_de: @prejudice.content_de, content_en: @prejudice.content_en, content_fr: @prejudice.content_fr } }
    end

    assert_redirected_to prejudice_url(Prejudice.last)
  end

  test "should show prejudice" do
    get prejudice_url(@prejudice)
    assert_response :success
  end

  test "should get edit" do
    get edit_prejudice_url(@prejudice)
    assert_response :success
  end

  test "should update prejudice" do
    patch prejudice_url(@prejudice), params: { prejudice: { content_de: @prejudice.content_de, content_en: @prejudice.content_en, content_fr: @prejudice.content_fr } }
    assert_redirected_to prejudice_url(@prejudice)
  end

  test "should destroy prejudice" do
    assert_difference('Prejudice.count', -1) do
      delete prejudice_url(@prejudice)
    end

    assert_redirected_to prejudices_url
  end
end
