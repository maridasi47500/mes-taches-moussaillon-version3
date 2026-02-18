require "application_system_test_case"

class TaskshaveaccomplishmentsTest < ApplicationSystemTestCase
  setup do
    @taskshaveaccomplishment = taskshaveaccomplishments(:one)
  end

  test "visiting the index" do
    visit taskshaveaccomplishments_url
    assert_selector "h1", text: "Taskshaveaccomplishments"
  end

  test "creating a Taskshaveaccomplishment" do
    visit taskshaveaccomplishments_url
    click_on "New Taskshaveaccomplishment"

    fill_in "Sailor", with: @taskshaveaccomplishment.sailor_id
    fill_in "Task", with: @taskshaveaccomplishment.task_id
    fill_in "Ticket", with: @taskshaveaccomplishment.ticket_id
    click_on "Create Taskshaveaccomplishment"

    assert_text "Taskshaveaccomplishment was successfully created"
    click_on "Back"
  end

  test "updating a Taskshaveaccomplishment" do
    visit taskshaveaccomplishments_url
    click_on "Edit", match: :first

    fill_in "Sailor", with: @taskshaveaccomplishment.sailor_id
    fill_in "Task", with: @taskshaveaccomplishment.task_id
    fill_in "Ticket", with: @taskshaveaccomplishment.ticket_id
    click_on "Update Taskshaveaccomplishment"

    assert_text "Taskshaveaccomplishment was successfully updated"
    click_on "Back"
  end

  test "destroying a Taskshaveaccomplishment" do
    visit taskshaveaccomplishments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Taskshaveaccomplishment was successfully destroyed"
  end
end
