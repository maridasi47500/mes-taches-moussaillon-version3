require "application_system_test_case"

class HackertasksTest < ApplicationSystemTestCase
  setup do
    @hackertask = hackertasks(:one)
  end

  test "visiting the index" do
    visit hackertasks_url
    assert_selector "h1", text: "Hackertasks"
  end

  test "creating a Hackertask" do
    visit hackertasks_url
    click_on "New Hackertask"

    fill_in "Name", with: @hackertask.name
    click_on "Create Hackertask"

    assert_text "Hackertask was successfully created"
    click_on "Back"
  end

  test "updating a Hackertask" do
    visit hackertasks_url
    click_on "Edit", match: :first

    fill_in "Name", with: @hackertask.name
    click_on "Update Hackertask"

    assert_text "Hackertask was successfully updated"
    click_on "Back"
  end

  test "destroying a Hackertask" do
    visit hackertasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hackertask was successfully destroyed"
  end
end
