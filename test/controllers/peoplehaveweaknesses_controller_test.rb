require 'test_helper'

class PeoplehaveweaknessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @peoplehaveweakness = peoplehaveweaknesses(:one)
  end

  test "should get index" do
    get peoplehaveweaknesses_url
    assert_response :success
  end

  test "should get new" do
    get new_peoplehaveweakness_url
    assert_response :success
  end

  test "should create peoplehaveweakness" do
    assert_difference('Peoplehaveweakness.count') do
      post peoplehaveweaknesses_url, params: { peoplehaveweakness: { linkspouseperson_id: @peoplehaveweakness.linkspouseperson_id, person_id: @peoplehaveweakness.person_id, user_id: @peoplehaveweakness.user_id, weakness_id: @peoplehaveweakness.weakness_id } }
    end

    assert_redirected_to peoplehaveweakness_url(Peoplehaveweakness.last)
  end

  test "should show peoplehaveweakness" do
    get peoplehaveweakness_url(@peoplehaveweakness)
    assert_response :success
  end

  test "should get edit" do
    get edit_peoplehaveweakness_url(@peoplehaveweakness)
    assert_response :success
  end

  test "should update peoplehaveweakness" do
    patch peoplehaveweakness_url(@peoplehaveweakness), params: { peoplehaveweakness: { linkspouseperson_id: @peoplehaveweakness.linkspouseperson_id, person_id: @peoplehaveweakness.person_id, user_id: @peoplehaveweakness.user_id, weakness_id: @peoplehaveweakness.weakness_id } }
    assert_redirected_to peoplehaveweakness_url(@peoplehaveweakness)
  end

  test "should destroy peoplehaveweakness" do
    assert_difference('Peoplehaveweakness.count', -1) do
      delete peoplehaveweakness_url(@peoplehaveweakness)
    end

    assert_redirected_to peoplehaveweaknesses_url
  end
end
