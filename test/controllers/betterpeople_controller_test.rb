require 'test_helper'

class BetterpeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @betterperson = betterpeople(:one)
  end

  test "should get index" do
    get betterpeople_url
    assert_response :success
  end

  test "should get new" do
    get new_betterperson_url
    assert_response :success
  end

  test "should create betterperson" do
    assert_difference('Betterperson.count') do
      post betterpeople_url, params: { betterperson: { attitude_id: @betterperson.attitude_id, twoperson_id: @betterperson.twoperson_id, user_id: @betterperson.user_id } }
    end

    assert_redirected_to betterperson_url(Betterperson.last)
  end

  test "should show betterperson" do
    get betterperson_url(@betterperson)
    assert_response :success
  end

  test "should get edit" do
    get edit_betterperson_url(@betterperson)
    assert_response :success
  end

  test "should update betterperson" do
    patch betterperson_url(@betterperson), params: { betterperson: { attitude_id: @betterperson.attitude_id, twoperson_id: @betterperson.twoperson_id, user_id: @betterperson.user_id } }
    assert_redirected_to betterperson_url(@betterperson)
  end

  test "should destroy betterperson" do
    assert_difference('Betterperson.count', -1) do
      delete betterperson_url(@betterperson)
    end

    assert_redirected_to betterpeople_url
  end
end
