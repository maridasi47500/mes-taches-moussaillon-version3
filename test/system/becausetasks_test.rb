require "application_system_test_case"

class BecausetasksTest < ApplicationSystemTestCase
  setup do
    @becausetask = becausetasks(:one)
  end

  test "visiting the index" do
    visit becausetasks_url
    assert_selector "h1", text: "Becausetasks"
  end

  test "creating a Becausetask" do
    visit becausetasks_url
    click_on "New Becausetask"

    fill_in "Othertask", with: @becausetask.othertask_id
    fill_in "Task", with: @becausetask.task_id
    click_on "Create Becausetask"

    assert_text "Becausetask was successfully created"
    click_on "Back"
  end

  test "updating a Becausetask" do
    visit becausetasks_url
    click_on "Edit", match: :first

    fill_in "Othertask", with: @becausetask.othertask_id
    fill_in "Task", with: @becausetask.task_id
    click_on "Update Becausetask"

    assert_text "Becausetask was successfully updated"
    click_on "Back"
  end

  test "destroying a Becausetask" do
    visit becausetasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Becausetask was successfully destroyed"
  end
end
