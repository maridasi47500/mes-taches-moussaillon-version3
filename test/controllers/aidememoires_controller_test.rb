require 'test_helper'

class AidememoiresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aidememoire = aidememoires(:one)
  end

  test "should get index" do
    get aidememoires_url
    assert_response :success
  end

  test "should get new" do
    get new_aidememoire_url
    assert_response :success
  end

  test "should create aidememoire" do
    assert_difference('Aidememoire.count') do
      post aidememoires_url, params: { aidememoire: { recordingphrase_id: @aidememoire.recordingphrase_id, recordingword_id: @aidememoire.recordingword_id } }
    end

    assert_redirected_to aidememoire_url(Aidememoire.last)
  end

  test "should show aidememoire" do
    get aidememoire_url(@aidememoire)
    assert_response :success
  end

  test "should get edit" do
    get edit_aidememoire_url(@aidememoire)
    assert_response :success
  end

  test "should update aidememoire" do
    patch aidememoire_url(@aidememoire), params: { aidememoire: { recordingphrase_id: @aidememoire.recordingphrase_id, recordingword_id: @aidememoire.recordingword_id } }
    assert_redirected_to aidememoire_url(@aidememoire)
  end

  test "should destroy aidememoire" do
    assert_difference('Aidememoire.count', -1) do
      delete aidememoire_url(@aidememoire)
    end

    assert_redirected_to aidememoires_url
  end
end
