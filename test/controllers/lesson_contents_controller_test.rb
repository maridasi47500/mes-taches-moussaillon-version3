require 'test_helper'

class LessonContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_content = lesson_contents(:one)
  end

  test "should get index" do
    get lesson_contents_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_content_url
    assert_response :success
  end

  test "should create lesson_content" do
    assert_difference('LessonContent.count') do
      post lesson_contents_url, params: { lesson_content: {  } }
    end

    assert_redirected_to lesson_content_url(LessonContent.last)
  end

  test "should show lesson_content" do
    get lesson_content_url(@lesson_content)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_content_url(@lesson_content)
    assert_response :success
  end

  test "should update lesson_content" do
    patch lesson_content_url(@lesson_content), params: { lesson_content: {  } }
    assert_redirected_to lesson_content_url(@lesson_content)
  end

  test "should destroy lesson_content" do
    assert_difference('LessonContent.count', -1) do
      delete lesson_content_url(@lesson_content)
    end

    assert_redirected_to lesson_contents_url
  end
end
