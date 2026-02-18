require "application_system_test_case"

class OptiontasksTest < ApplicationSystemTestCase
  setup do
    @optiontask = optiontasks(:one)
  end

  test "visiting the index" do
    visit optiontasks_url
    assert_selector "h1", text: "Optiontasks"
  end

  test "creating a Optiontask" do
    visit optiontasks_url
    click_on "New Optiontask"

    fill_in "Optiontask", with: @optiontask.optiontask_id
    fill_in "Task", with: @optiontask.task_id
    click_on "Create Optiontask"

    assert_text "Optiontask was successfully created"
    click_on "Back"
  end

  test "updating a Optiontask" do
    visit optiontasks_url
    click_on "Edit", match: :first

    fill_in "Optiontask", with: @optiontask.optiontask_id
    fill_in "Task", with: @optiontask.task_id
    click_on "Update Optiontask"

    assert_text "Optiontask was successfully updated"
    click_on "Back"
  end

  test "destroying a Optiontask" do
    visit optiontasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Optiontask was successfully destroyed"
  end
end
