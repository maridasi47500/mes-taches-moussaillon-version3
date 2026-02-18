require 'test_helper'

class PeoplerelationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @peoplerelation = peoplerelations(:one)
  end

  test "should get index" do
    get peoplerelations_url
    assert_response :success
  end

  test "should get new" do
    get new_peoplerelation_url
    assert_response :success
  end

  test "should create peoplerelation" do
    assert_difference('Peoplerelation.count') do
      post peoplerelations_url, params: { peoplerelation: { name: @peoplerelation.name } }
    end

    assert_redirected_to peoplerelation_url(Peoplerelation.last)
  end

  test "should show peoplerelation" do
    get peoplerelation_url(@peoplerelation)
    assert_response :success
  end

  test "should get edit" do
    get edit_peoplerelation_url(@peoplerelation)
    assert_response :success
  end

  test "should update peoplerelation" do
    patch peoplerelation_url(@peoplerelation), params: { peoplerelation: { name: @peoplerelation.name } }
    assert_redirected_to peoplerelation_url(@peoplerelation)
  end

  test "should destroy peoplerelation" do
    assert_difference('Peoplerelation.count', -1) do
      delete peoplerelation_url(@peoplerelation)
    end

    assert_redirected_to peoplerelations_url
  end
end
