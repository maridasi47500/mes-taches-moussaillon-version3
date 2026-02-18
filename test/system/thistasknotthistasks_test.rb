require "application_system_test_case"

class ThistasknotthistasksTest < ApplicationSystemTestCase
  setup do
    @thistasknotthistask = thistasknotthistasks(:one)
  end

  test "visiting the index" do
    visit thistasknotthistasks_url
    assert_selector "h1", text: "Thistasknotthistasks"
  end

  test "creating a Thistasknotthistask" do
    visit thistasknotthistasks_url
    click_on "New Thistasknotthistask"

    fill_in "Othertask", with: @thistasknotthistask.othertask_id
    fill_in "Task", with: @thistasknotthistask.task_id
    click_on "Create Thistasknotthistask"

    assert_text "Thistasknotthistask was successfully created"
    click_on "Back"
  end

  test "updating a Thistasknotthistask" do
    visit thistasknotthistasks_url
    click_on "Edit", match: :first

    fill_in "Othertask", with: @thistasknotthistask.othertask_id
    fill_in "Task", with: @thistasknotthistask.task_id
    click_on "Update Thistasknotthistask"

    assert_text "Thistasknotthistask was successfully updated"
    click_on "Back"
  end

  test "destroying a Thistasknotthistask" do
    visit thistasknotthistasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Thistasknotthistask was successfully destroyed"
  end
end
