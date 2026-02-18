require 'test_helper'

class ActionlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actionlist = actionlists(:one)
  end

  test "should get index" do
    get actionlists_url
    assert_response :success
  end

  test "should get new" do
    get new_actionlist_url
    assert_response :success
  end

  test "should create actionlist" do
    assert_difference('Actionlist.count') do
      post actionlists_url, params: { actionlist: { title_de: @actionlist.title_de, title_en: @actionlist.title_en, title_fr: @actionlist.title_fr } }
    end

    assert_redirected_to actionlist_url(Actionlist.last)
  end

  test "should show actionlist" do
    get actionlist_url(@actionlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_actionlist_url(@actionlist)
    assert_response :success
  end

  test "should update actionlist" do
    patch actionlist_url(@actionlist), params: { actionlist: { title_de: @actionlist.title_de, title_en: @actionlist.title_en, title_fr: @actionlist.title_fr } }
    assert_redirected_to actionlist_url(@actionlist)
  end

  test "should destroy actionlist" do
    assert_difference('Actionlist.count', -1) do
      delete actionlist_url(@actionlist)
    end

    assert_redirected_to actionlists_url
  end
end
