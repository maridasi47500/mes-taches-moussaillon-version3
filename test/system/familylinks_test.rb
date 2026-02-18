require "application_system_test_case"

class FamilylinksTest < ApplicationSystemTestCase
  setup do
    @familylink = familylinks(:one)
  end

  test "visiting the index" do
    visit familylinks_url
    assert_selector "h1", text: "Familylinks"
  end

  test "creating a Familylink" do
    visit familylinks_url
    click_on "New Familylink"

    fill_in "Name de", with: @familylink.name_de
    fill_in "Name en", with: @familylink.name_en
    fill_in "Name fr", with: @familylink.name_fr
    click_on "Create Familylink"

    assert_text "Familylink was successfully created"
    click_on "Back"
  end

  test "updating a Familylink" do
    visit familylinks_url
    click_on "Edit", match: :first

    fill_in "Name de", with: @familylink.name_de
    fill_in "Name en", with: @familylink.name_en
    fill_in "Name fr", with: @familylink.name_fr
    click_on "Update Familylink"

    assert_text "Familylink was successfully updated"
    click_on "Back"
  end

  test "destroying a Familylink" do
    visit familylinks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Familylink was successfully destroyed"
  end
end
