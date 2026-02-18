require "application_system_test_case"

class WeaknessesTest < ApplicationSystemTestCase
  setup do
    @weakness = weaknesses(:one)
  end

  test "visiting the index" do
    visit weaknesses_url
    assert_selector "h1", text: "Weaknesses"
  end

  test "creating a Weakness" do
    visit weaknesses_url
    click_on "New Weakness"

    fill_in "Name de", with: @weakness.name_de
    fill_in "Name en", with: @weakness.name_en
    fill_in "Name fr", with: @weakness.name_fr
    click_on "Create Weakness"

    assert_text "Weakness was successfully created"
    click_on "Back"
  end

  test "updating a Weakness" do
    visit weaknesses_url
    click_on "Edit", match: :first

    fill_in "Name de", with: @weakness.name_de
    fill_in "Name en", with: @weakness.name_en
    fill_in "Name fr", with: @weakness.name_fr
    click_on "Update Weakness"

    assert_text "Weakness was successfully updated"
    click_on "Back"
  end

  test "destroying a Weakness" do
    visit weaknesses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Weakness was successfully destroyed"
  end
end
