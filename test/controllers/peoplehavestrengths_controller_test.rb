require 'test_helper'

class PeoplehavestrengthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @peoplehavestrength = peoplehavestrengths(:one)
  end

  test "should get index" do
    get peoplehavestrengths_url
    assert_response :success
  end

  test "should get new" do
    get new_peoplehavestrength_url
    assert_response :success
  end

  test "should create peoplehavestrength" do
    assert_difference('Peoplehavestrength.count') do
      post peoplehavestrengths_url, params: { peoplehavestrength: { linkspouseperson_id: @peoplehavestrength.linkspouseperson_id, person_id: @peoplehavestrength.person_id, strength_id: @peoplehavestrength.strength_id, user_id: @peoplehavestrength.user_id } }
    end

    assert_redirected_to peoplehavestrength_url(Peoplehavestrength.last)
  end

  test "should show peoplehavestrength" do
    get peoplehavestrength_url(@peoplehavestrength)
    assert_response :success
  end

  test "should get edit" do
    get edit_peoplehavestrength_url(@peoplehavestrength)
    assert_response :success
  end

  test "should update peoplehavestrength" do
    patch peoplehavestrength_url(@peoplehavestrength), params: { peoplehavestrength: { linkspouseperson_id: @peoplehavestrength.linkspouseperson_id, person_id: @peoplehavestrength.person_id, strength_id: @peoplehavestrength.strength_id, user_id: @peoplehavestrength.user_id } }
    assert_redirected_to peoplehavestrength_url(@peoplehavestrength)
  end

  test "should destroy peoplehavestrength" do
    assert_difference('Peoplehavestrength.count', -1) do
      delete peoplehavestrength_url(@peoplehavestrength)
    end

    assert_redirected_to peoplehavestrengths_url
  end
end
