require 'test_helper'

class LessonRecordingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_recording = lesson_recordings(:one)
  end

  test "should get index" do
    get lesson_recordings_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_recording_url
    assert_response :success
  end

  test "should create lesson_recording" do
    assert_difference('LessonRecording.count') do
      post lesson_recordings_url, params: { lesson_recording: {  } }
    end

    assert_redirected_to lesson_recording_url(LessonRecording.last)
  end

  test "should show lesson_recording" do
    get lesson_recording_url(@lesson_recording)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_recording_url(@lesson_recording)
    assert_response :success
  end

  test "should update lesson_recording" do
    patch lesson_recording_url(@lesson_recording), params: { lesson_recording: {  } }
    assert_redirected_to lesson_recording_url(@lesson_recording)
  end

  test "should destroy lesson_recording" do
    assert_difference('LessonRecording.count', -1) do
      delete lesson_recording_url(@lesson_recording)
    end

    assert_redirected_to lesson_recordings_url
  end
end
