require 'test_helper'

class PersongraduatedschoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @persongraduatedschool = persongraduatedschools(:one)
  end

  test "should get index" do
    get persongraduatedschools_url
    assert_response :success
  end

  test "should get new" do
    get new_persongraduatedschool_url
    assert_response :success
  end

  test "should create persongraduatedschool" do
    assert_difference('Persongraduatedschool.count') do
      post persongraduatedschools_url, params: { persongraduatedschool: {  } }
    end

    assert_redirected_to persongraduatedschool_url(Persongraduatedschool.last)
  end

  test "should show persongraduatedschool" do
    get persongraduatedschool_url(@persongraduatedschool)
    assert_response :success
  end

  test "should get edit" do
    get edit_persongraduatedschool_url(@persongraduatedschool)
    assert_response :success
  end

  test "should update persongraduatedschool" do
    patch persongraduatedschool_url(@persongraduatedschool), params: { persongraduatedschool: {  } }
    assert_redirected_to persongraduatedschool_url(@persongraduatedschool)
  end

  test "should destroy persongraduatedschool" do
    assert_difference('Persongraduatedschool.count', -1) do
      delete persongraduatedschool_url(@persongraduatedschool)
    end

    assert_redirected_to persongraduatedschools_url
  end
end
