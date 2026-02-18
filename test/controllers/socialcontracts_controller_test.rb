require 'test_helper'

class SocialcontractsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @socialcontract = socialcontracts(:one)
  end

  test "should get index" do
    get socialcontracts_url
    assert_response :success
  end

  test "should get new" do
    get new_socialcontract_url
    assert_response :success
  end

  test "should create socialcontract" do
    assert_difference('Socialcontract.count') do
      post socialcontracts_url, params: { socialcontract: { otherperson_id: @socialcontract.otherperson_id, person_id: @socialcontract.person_id } }
    end

    assert_redirected_to socialcontract_url(Socialcontract.last)
  end

  test "should show socialcontract" do
    get socialcontract_url(@socialcontract)
    assert_response :success
  end

  test "should get edit" do
    get edit_socialcontract_url(@socialcontract)
    assert_response :success
  end

  test "should update socialcontract" do
    patch socialcontract_url(@socialcontract), params: { socialcontract: { otherperson_id: @socialcontract.otherperson_id, person_id: @socialcontract.person_id } }
    assert_redirected_to socialcontract_url(@socialcontract)
  end

  test "should destroy socialcontract" do
    assert_difference('Socialcontract.count', -1) do
      delete socialcontract_url(@socialcontract)
    end

    assert_redirected_to socialcontracts_url
  end
end
