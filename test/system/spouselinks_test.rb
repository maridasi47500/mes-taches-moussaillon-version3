require "application_system_test_case"

class SpouselinksTest < ApplicationSystemTestCase
  setup do
    @spouselink = spouselinks(:one)
  end

  test "visiting the index" do
    visit spouselinks_url
    assert_selector "h1", text: "Spouselinks"
  end

  test "creating a Spouselink" do
    visit spouselinks_url
    click_on "New Spouselink"

    fill_in "Name de", with: @spouselink.name_de
    fill_in "Name en", with: @spouselink.name_en
    fill_in "Name fr", with: @spouselink.name_fr
    click_on "Create Spouselink"

    assert_text "Spouselink was successfully created"
    click_on "Back"
  end

  test "updating a Spouselink" do
    visit spouselinks_url
    click_on "Edit", match: :first

    fill_in "Name de", with: @spouselink.name_de
    fill_in "Name en", with: @spouselink.name_en
    fill_in "Name fr", with: @spouselink.name_fr
    click_on "Update Spouselink"

    assert_text "Spouselink was successfully updated"
    click_on "Back"
  end

  test "destroying a Spouselink" do
    visit spouselinks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spouselink was successfully destroyed"
  end
end
