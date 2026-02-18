require "application_system_test_case"

class LessonRecordingsTest < ApplicationSystemTestCase
  setup do
    @lesson_recording = lesson_recordings(:one)
  end

  test "visiting the index" do
    visit lesson_recordings_url
    assert_selector "h1", text: "Lesson Recordings"
  end

  test "creating a Lesson recording" do
    visit lesson_recordings_url
    click_on "New Lesson Recording"

    click_on "Create Lesson recording"

    assert_text "Lesson recording was successfully created"
    click_on "Back"
  end

  test "updating a Lesson recording" do
    visit lesson_recordings_url
    click_on "Edit", match: :first

    click_on "Update Lesson recording"

    assert_text "Lesson recording was successfully updated"
    click_on "Back"
  end

  test "destroying a Lesson recording" do
    visit lesson_recordings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lesson recording was successfully destroyed"
  end
end
