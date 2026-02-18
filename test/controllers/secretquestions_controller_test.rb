require 'test_helper'

class SecretquestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @secretquestion = secretquestions(:one)
  end

  test "should get index" do
    get secretquestions_url
    assert_response :success
  end

  test "should get new" do
    get new_secretquestion_url
    assert_response :success
  end

  test "should create secretquestion" do
    assert_difference('Secretquestion.count') do
      post secretquestions_url, params: { secretquestion: { text: @secretquestion.text, typeq: @secretquestion.typeq } }
    end

    assert_redirected_to secretquestion_url(Secretquestion.last)
  end

  test "should show secretquestion" do
    get secretquestion_url(@secretquestion)
    assert_response :success
  end

  test "should get edit" do
    get edit_secretquestion_url(@secretquestion)
    assert_response :success
  end

  test "should update secretquestion" do
    patch secretquestion_url(@secretquestion), params: { secretquestion: { text: @secretquestion.text, typeq: @secretquestion.typeq } }
    assert_redirected_to secretquestion_url(@secretquestion)
  end

  test "should destroy secretquestion" do
    assert_difference('Secretquestion.count', -1) do
      delete secretquestion_url(@secretquestion)
    end

    assert_redirected_to secretquestions_url
  end
end
