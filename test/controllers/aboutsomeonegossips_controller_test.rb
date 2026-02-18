require 'test_helper'

class AboutsomeonegossipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aboutsomeonegossip = aboutsomeonegossips(:one)
  end

  test "should get index" do
    get aboutsomeonegossips_url
    assert_response :success
  end

  test "should get new" do
    get new_aboutsomeonegossip_url
    assert_response :success
  end

  test "should create aboutsomeonegossip" do
    assert_difference('Aboutsomeonegossip.count') do
      post aboutsomeonegossips_url, params: { aboutsomeonegossip: { content: @aboutsomeonegossip.content } }
    end

    assert_redirected_to aboutsomeonegossip_url(Aboutsomeonegossip.last)
  end

  test "should show aboutsomeonegossip" do
    get aboutsomeonegossip_url(@aboutsomeonegossip)
    assert_response :success
  end

  test "should get edit" do
    get edit_aboutsomeonegossip_url(@aboutsomeonegossip)
    assert_response :success
  end

  test "should update aboutsomeonegossip" do
    patch aboutsomeonegossip_url(@aboutsomeonegossip), params: { aboutsomeonegossip: { content: @aboutsomeonegossip.content } }
    assert_redirected_to aboutsomeonegossip_url(@aboutsomeonegossip)
  end

  test "should destroy aboutsomeonegossip" do
    assert_difference('Aboutsomeonegossip.count', -1) do
      delete aboutsomeonegossip_url(@aboutsomeonegossip)
    end

    assert_redirected_to aboutsomeonegossips_url
  end
end
