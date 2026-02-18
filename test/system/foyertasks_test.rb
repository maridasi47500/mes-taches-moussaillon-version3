require "application_system_test_case"

class FoyertasksTest < ApplicationSystemTestCase
  setup do
    @foyertask = foyertasks(:one)
  end

  test "visiting the index" do
    visit foyertasks_url
    assert_selector "h1", text: "Foyertasks"
  end

  test "creating a Foyertask" do
    visit foyertasks_url
    click_on "New Foyertask"

    fill_in "Task", with: @foyertask.task
    fill_in "User1", with: @foyertask.user1
    fill_in "User2", with: @foyertask.user2
    click_on "Create Foyertask"

    assert_text "Foyertask was successfully created"
    click_on "Back"
  end

  test "updating a Foyertask" do
    visit foyertasks_url
    click_on "Edit", match: :first

    fill_in "Task", with: @foyertask.task
    fill_in "User1", with: @foyertask.user1
    fill_in "User2", with: @foyertask.user2
    click_on "Update Foyertask"

    assert_text "Foyertask was successfully updated"
    click_on "Back"
  end

  test "destroying a Foyertask" do
    visit foyertasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Foyertask was successfully destroyed"
  end
end
