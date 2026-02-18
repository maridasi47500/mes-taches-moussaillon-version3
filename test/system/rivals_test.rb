require "application_system_test_case"

class RivalsTest < ApplicationSystemTestCase
  setup do
    @rival = rivals(:one)
  end

  test "visiting the index" do
    visit rivals_url
    assert_selector "h1", text: "Rivals"
  end

  test "creating a Rival" do
    visit rivals_url
    click_on "New Rival"

    fill_in "Fakelover", with: @rival.fakelover_id
    fill_in "Reallover", with: @rival.reallover_id
    click_on "Create Rival"

    assert_text "Rival was successfully created"
    click_on "Back"
  end

  test "updating a Rival" do
    visit rivals_url
    click_on "Edit", match: :first

    fill_in "Fakelover", with: @rival.fakelover_id
    fill_in "Reallover", with: @rival.reallover_id
    click_on "Update Rival"

    assert_text "Rival was successfully updated"
    click_on "Back"
  end

  test "destroying a Rival" do
    visit rivals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rival was successfully destroyed"
  end
end
