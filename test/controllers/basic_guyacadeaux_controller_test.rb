require 'test_helper'

class BasicGuyacadeauxControllerTest < ActionDispatch::IntegrationTest
  setup do
    @basic_guyacadeau = basic_guyacadeaux(:one)
  end

  test "should get index" do
    get basic_guyacadeaux_url
    assert_response :success
  end

  test "should get new" do
    get new_basic_guyacadeau_url
    assert_response :success
  end

  test "should create basic_guyacadeau" do
    assert_difference('BasicGuyacadeau.count') do
      post basic_guyacadeaux_url, params: { basic_guyacadeau: { address_id: @basic_guyacadeau.address_id, person_id: @basic_guyacadeau.person_id, price: @basic_guyacadeau.price } }
    end

    assert_redirected_to basic_guyacadeau_url(BasicGuyacadeau.last)
  end

  test "should show basic_guyacadeau" do
    get basic_guyacadeau_url(@basic_guyacadeau)
    assert_response :success
  end

  test "should get edit" do
    get edit_basic_guyacadeau_url(@basic_guyacadeau)
    assert_response :success
  end

  test "should update basic_guyacadeau" do
    patch basic_guyacadeau_url(@basic_guyacadeau), params: { basic_guyacadeau: { address_id: @basic_guyacadeau.address_id, person_id: @basic_guyacadeau.person_id, price: @basic_guyacadeau.price } }
    assert_redirected_to basic_guyacadeau_url(@basic_guyacadeau)
  end

  test "should destroy basic_guyacadeau" do
    assert_difference('BasicGuyacadeau.count', -1) do
      delete basic_guyacadeau_url(@basic_guyacadeau)
    end

    assert_redirected_to basic_guyacadeaux_url
  end
end
