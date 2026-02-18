require "application_system_test_case"

class NationalitiesTest < ApplicationSystemTestCase
  setup do
    @nationality = nationalities(:one)
  end

  test "visiting the index" do
    visit nationalities_url
    assert_selector "h1", text: "Nationalities"
  end

  test "creating a Nationality" do
    visit nationalities_url
    click_on "New Nationality"

    fill_in "", with: @nationality.
    fill_in "Name de", with: @nationality.name_de
    fill_in "Name en", with: @nationality.name_en
    click_on "Create Nationality"

    assert_text "Nationality was successfully created"
    click_on "Back"
  end

  test "updating a Nationality" do
    visit nationalities_url
    click_on "Edit", match: :first

    fill_in "", with: @nationality.
    fill_in "Name de", with: @nationality.name_de
    fill_in "Name en", with: @nationality.name_en
    click_on "Update Nationality"

    assert_text "Nationality was successfully updated"
    click_on "Back"
  end

  test "destroying a Nationality" do
    visit nationalities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nationality was successfully destroyed"
  end
end
