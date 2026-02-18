require 'test_helper'

class WithorwithoutyousControllerTest < ActionDispatch::IntegrationTest
  setup do
    @withorwithoutyou = withorwithoutyous(:one)
  end

  test "should get index" do
    get withorwithoutyous_url
    assert_response :success
  end

  test "should get new" do
    get new_withorwithoutyou_url
    assert_response :success
  end

  test "should create withorwithoutyou" do
    assert_difference('Withorwithoutyou.count') do
      post withorwithoutyous_url, params: { withorwithoutyou: {  } }
    end

    assert_redirected_to withorwithoutyou_url(Withorwithoutyou.last)
  end

  test "should show withorwithoutyou" do
    get withorwithoutyou_url(@withorwithoutyou)
    assert_response :success
  end

  test "should get edit" do
    get edit_withorwithoutyou_url(@withorwithoutyou)
    assert_response :success
  end

  test "should update withorwithoutyou" do
    patch withorwithoutyou_url(@withorwithoutyou), params: { withorwithoutyou: {  } }
    assert_redirected_to withorwithoutyou_url(@withorwithoutyou)
  end

  test "should destroy withorwithoutyou" do
    assert_difference('Withorwithoutyou.count', -1) do
      delete withorwithoutyou_url(@withorwithoutyou)
    end

    assert_redirected_to withorwithoutyous_url
  end
end
