require 'test_helper'

class FromsomeonegossipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fromsomeonegossip = fromsomeonegossips(:one)
  end

  test "should get index" do
    get fromsomeonegossips_url
    assert_response :success
  end

  test "should get new" do
    get new_fromsomeonegossip_url
    assert_response :success
  end

  test "should create fromsomeonegossip" do
    assert_difference('Fromsomeonegossip.count') do
      post fromsomeonegossips_url, params: { fromsomeonegossip: { content: @fromsomeonegossip.content } }
    end

    assert_redirected_to fromsomeonegossip_url(Fromsomeonegossip.last)
  end

  test "should show fromsomeonegossip" do
    get fromsomeonegossip_url(@fromsomeonegossip)
    assert_response :success
  end

  test "should get edit" do
    get edit_fromsomeonegossip_url(@fromsomeonegossip)
    assert_response :success
  end

  test "should update fromsomeonegossip" do
    patch fromsomeonegossip_url(@fromsomeonegossip), params: { fromsomeonegossip: { content: @fromsomeonegossip.content } }
    assert_redirected_to fromsomeonegossip_url(@fromsomeonegossip)
  end

  test "should destroy fromsomeonegossip" do
    assert_difference('Fromsomeonegossip.count', -1) do
      delete fromsomeonegossip_url(@fromsomeonegossip)
    end

    assert_redirected_to fromsomeonegossips_url
  end
end
