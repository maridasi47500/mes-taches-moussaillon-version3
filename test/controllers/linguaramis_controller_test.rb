require 'test_helper'

class LinguaramisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @linguarami = linguaramis(:one)
  end

  test "should get index" do
    get linguaramis_url
    assert_response :success
  end

  test "should get new" do
    get new_linguarami_url
    assert_response :success
  end

  test "should create linguarami" do
    assert_difference('Linguarami.count') do
      post linguaramis_url, params: { linguarami: {  } }
    end

    assert_redirected_to linguarami_url(Linguarami.last)
  end

  test "should show linguarami" do
    get linguarami_url(@linguarami)
    assert_response :success
  end

  test "should get edit" do
    get edit_linguarami_url(@linguarami)
    assert_response :success
  end

  test "should update linguarami" do
    patch linguarami_url(@linguarami), params: { linguarami: {  } }
    assert_redirected_to linguarami_url(@linguarami)
  end

  test "should destroy linguarami" do
    assert_difference('Linguarami.count', -1) do
      delete linguarami_url(@linguarami)
    end

    assert_redirected_to linguaramis_url
  end
end
