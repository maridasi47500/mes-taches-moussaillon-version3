require "application_system_test_case"

class TorealizetasksTest < ApplicationSystemTestCase
  setup do
    @torealizetask = torealizetasks(:one)
  end

  test "visiting the index" do
    visit torealizetasks_url
    assert_selector "h1", text: "Torealizetasks"
  end

  test "creating a Torealizetask" do
    visit torealizetasks_url
    click_on "New Torealizetask"

    fill_in "Task", with: @torealizetask.task_id
    fill_in "User", with: @torealizetask.user_id
    click_on "Create Torealizetask"

    assert_text "Torealizetask was successfully created"
    click_on "Back"
  end

  test "updating a Torealizetask" do
    visit torealizetasks_url
    click_on "Edit", match: :first

    fill_in "Task", with: @torealizetask.task_id
    fill_in "User", with: @torealizetask.user_id
    click_on "Update Torealizetask"

    assert_text "Torealizetask was successfully updated"
    click_on "Back"
  end

  test "destroying a Torealizetask" do
    visit torealizetasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Torealizetask was successfully destroyed"
  end
end
