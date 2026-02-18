require 'test_helper'

class MysentencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mysentence = mysentences(:one)
  end

  test "should get index" do
    get mysentences_url
    assert_response :success
  end

  test "should get new" do
    get new_mysentence_url
    assert_response :success
  end

  test "should create mysentence" do
    assert_difference('Mysentence.count') do
      post mysentences_url, params: { mysentence: { content_de: @mysentence.content_de, content_en: @mysentence.content_en, content_fr: @mysentence.content_fr } }
    end

    assert_redirected_to mysentence_url(Mysentence.last)
  end

  test "should show mysentence" do
    get mysentence_url(@mysentence)
    assert_response :success
  end

  test "should get edit" do
    get edit_mysentence_url(@mysentence)
    assert_response :success
  end

  test "should update mysentence" do
    patch mysentence_url(@mysentence), params: { mysentence: { content_de: @mysentence.content_de, content_en: @mysentence.content_en, content_fr: @mysentence.content_fr } }
    assert_redirected_to mysentence_url(@mysentence)
  end

  test "should destroy mysentence" do
    assert_difference('Mysentence.count', -1) do
      delete mysentence_url(@mysentence)
    end

    assert_redirected_to mysentences_url
  end
end
