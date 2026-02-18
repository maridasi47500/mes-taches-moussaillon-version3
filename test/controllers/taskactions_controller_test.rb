require 'test_helper'

class TaskactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @taskaction = taskactions(:one)
  end

  test "should get index" do
    get taskactions_url
    assert_response :success
  end

  test "should get new" do
    get new_taskaction_url
    assert_response :success
  end

  test "should create taskaction" do
    assert_difference('Taskaction.count') do
      post taskactions_url, params: { taskaction: { name_de: @taskaction.name_de, name_en: @taskaction.name_en, name_fr: @taskaction.name_fr } }
    end

    assert_redirected_to taskaction_url(Taskaction.last)
  end

  test "should show taskaction" do
    get taskaction_url(@taskaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_taskaction_url(@taskaction)
    assert_response :success
  end

  test "should update taskaction" do
    patch taskaction_url(@taskaction), params: { taskaction: { name_de: @taskaction.name_de, name_en: @taskaction.name_en, name_fr: @taskaction.name_fr } }
    assert_redirected_to taskaction_url(@taskaction)
  end

  test "should destroy taskaction" do
    assert_difference('Taskaction.count', -1) do
      delete taskaction_url(@taskaction)
    end

    assert_redirected_to taskactions_url
  end
end
