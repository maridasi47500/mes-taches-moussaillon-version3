require "application_system_test_case"

class ScheduledtasksTest < ApplicationSystemTestCase
  setup do
    @scheduledtask = scheduledtasks(:one)
  end

  test "visiting the index" do
    visit scheduledtasks_url
    assert_selector "h1", text: "Scheduledtasks"
  end

  test "creating a Scheduledtask" do
    visit scheduledtasks_url
    click_on "New Scheduledtask"

    fill_in "Date and time", with: @scheduledtask.date_and_time
    fill_in "Name", with: @scheduledtask.name
    fill_in "Person", with: @scheduledtask.person_id
    click_on "Create Scheduledtask"

    assert_text "Scheduledtask was successfully created"
    click_on "Back"
  end

  test "updating a Scheduledtask" do
    visit scheduledtasks_url
    click_on "Edit", match: :first

    fill_in "Date and time", with: @scheduledtask.date_and_time
    fill_in "Name", with: @scheduledtask.name
    fill_in "Person", with: @scheduledtask.person_id
    click_on "Update Scheduledtask"

    assert_text "Scheduledtask was successfully updated"
    click_on "Back"
  end

  test "destroying a Scheduledtask" do
    visit scheduledtasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scheduledtask was successfully destroyed"
  end
end
