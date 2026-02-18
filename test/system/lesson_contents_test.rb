require "application_system_test_case"

class LessonContentsTest < ApplicationSystemTestCase
  setup do
    @lesson_content = lesson_contents(:one)
  end

  test "visiting the index" do
    visit lesson_contents_url
    assert_selector "h1", text: "Lesson Contents"
  end

  test "creating a Lesson content" do
    visit lesson_contents_url
    click_on "New Lesson Content"

    click_on "Create Lesson content"

    assert_text "Lesson content was successfully created"
    click_on "Back"
  end

  test "updating a Lesson content" do
    visit lesson_contents_url
    click_on "Edit", match: :first

    click_on "Update Lesson content"

    assert_text "Lesson content was successfully updated"
    click_on "Back"
  end

  test "destroying a Lesson content" do
    visit lesson_contents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lesson content was successfully destroyed"
  end
end
