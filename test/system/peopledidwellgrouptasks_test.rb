require "application_system_test_case"

class PeopledidwellgrouptasksTest < ApplicationSystemTestCase
  setup do
    @peopledidwellgrouptask = peopledidwellgrouptasks(:one)
  end

  test "visiting the index" do
    visit peopledidwellgrouptasks_url
    assert_selector "h1", text: "Peopledidwellgrouptasks"
  end

  test "creating a Peopledidwellgrouptask" do
    visit peopledidwellgrouptasks_url
    click_on "New Peopledidwellgrouptask"

    fill_in "Rating", with: @peopledidwellgrouptask.rating
    fill_in "Sailorgrouptask", with: @peopledidwellgrouptask.sailorgrouptask_id
    fill_in "User", with: @peopledidwellgrouptask.user_id
    click_on "Create Peopledidwellgrouptask"

    assert_text "Peopledidwellgrouptask was successfully created"
    click_on "Back"
  end

  test "updating a Peopledidwellgrouptask" do
    visit peopledidwellgrouptasks_url
    click_on "Edit", match: :first

    fill_in "Rating", with: @peopledidwellgrouptask.rating
    fill_in "Sailorgrouptask", with: @peopledidwellgrouptask.sailorgrouptask_id
    fill_in "User", with: @peopledidwellgrouptask.user_id
    click_on "Update Peopledidwellgrouptask"

    assert_text "Peopledidwellgrouptask was successfully updated"
    click_on "Back"
  end

  test "destroying a Peopledidwellgrouptask" do
    visit peopledidwellgrouptasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Peopledidwellgrouptask was successfully destroyed"
  end
end
