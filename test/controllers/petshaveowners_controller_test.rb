require 'test_helper'

class PetshaveownersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @petshaveowner = petshaveowners(:one)
  end

  test "should get index" do
    get petshaveowners_url
    assert_response :success
  end

  test "should get new" do
    get new_petshaveowner_url
    assert_response :success
  end

  test "should create petshaveowner" do
    assert_difference('Petshaveowner.count') do
      post petshaveowners_url, params: { petshaveowner: {  } }
    end

    assert_redirected_to petshaveowner_url(Petshaveowner.last)
  end

  test "should show petshaveowner" do
    get petshaveowner_url(@petshaveowner)
    assert_response :success
  end

  test "should get edit" do
    get edit_petshaveowner_url(@petshaveowner)
    assert_response :success
  end

  test "should update petshaveowner" do
    patch petshaveowner_url(@petshaveowner), params: { petshaveowner: {  } }
    assert_redirected_to petshaveowner_url(@petshaveowner)
  end

  test "should destroy petshaveowner" do
    assert_difference('Petshaveowner.count', -1) do
      delete petshaveowner_url(@petshaveowner)
    end

    assert_redirected_to petshaveowners_url
  end
end
