require 'test_helper'

class RightaboutsomeonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rightaboutsomeone = rightaboutsomeones(:one)
  end

  test "should get index" do
    get rightaboutsomeones_url
    assert_response :success
  end

  test "should get new" do
    get new_rightaboutsomeone_url
    assert_response :success
  end

  test "should create rightaboutsomeone" do
    assert_difference('Rightaboutsomeone.count') do
      post rightaboutsomeones_url, params: { rightaboutsomeone: { description_de: @rightaboutsomeone.description_de, description_en: @rightaboutsomeone.description_en, description_fr: @rightaboutsomeone.description_fr, question_de: @rightaboutsomeone.question_de, question_en: @rightaboutsomeone.question_en, question_fr: @rightaboutsomeone.question_fr } }
    end

    assert_redirected_to rightaboutsomeone_url(Rightaboutsomeone.last)
  end

  test "should show rightaboutsomeone" do
    get rightaboutsomeone_url(@rightaboutsomeone)
    assert_response :success
  end

  test "should get edit" do
    get edit_rightaboutsomeone_url(@rightaboutsomeone)
    assert_response :success
  end

  test "should update rightaboutsomeone" do
    patch rightaboutsomeone_url(@rightaboutsomeone), params: { rightaboutsomeone: { description_de: @rightaboutsomeone.description_de, description_en: @rightaboutsomeone.description_en, description_fr: @rightaboutsomeone.description_fr, question_de: @rightaboutsomeone.question_de, question_en: @rightaboutsomeone.question_en, question_fr: @rightaboutsomeone.question_fr } }
    assert_redirected_to rightaboutsomeone_url(@rightaboutsomeone)
  end

  test "should destroy rightaboutsomeone" do
    assert_difference('Rightaboutsomeone.count', -1) do
      delete rightaboutsomeone_url(@rightaboutsomeone)
    end

    assert_redirected_to rightaboutsomeones_url
  end
end
