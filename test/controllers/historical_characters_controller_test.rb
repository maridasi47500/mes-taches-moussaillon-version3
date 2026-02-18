require 'test_helper'

class HistoricalCharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historical_character = historical_characters(:one)
  end

  test "should get index" do
    get historical_characters_url
    assert_response :success
  end

  test "should get new" do
    get new_historical_character_url
    assert_response :success
  end

  test "should create historical_character" do
    assert_difference('HistoricalCharacter.count') do
      post historical_characters_url, params: { historical_character: { image: @historical_character.image, name: @historical_character.name } }
    end

    assert_redirected_to historical_character_url(HistoricalCharacter.last)
  end

  test "should show historical_character" do
    get historical_character_url(@historical_character)
    assert_response :success
  end

  test "should get edit" do
    get edit_historical_character_url(@historical_character)
    assert_response :success
  end

  test "should update historical_character" do
    patch historical_character_url(@historical_character), params: { historical_character: { image: @historical_character.image, name: @historical_character.name } }
    assert_redirected_to historical_character_url(@historical_character)
  end

  test "should destroy historical_character" do
    assert_difference('HistoricalCharacter.count', -1) do
      delete historical_character_url(@historical_character)
    end

    assert_redirected_to historical_characters_url
  end
end
