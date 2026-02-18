require "application_system_test_case"

class ArmycompagniesTest < ApplicationSystemTestCase
  setup do
    @armycompagny = armycompagnies(:one)
  end

  test "visiting the index" do
    visit armycompagnies_url
    assert_selector "h1", text: "Armycompagnies"
  end

  test "creating a Armycompagny" do
    visit armycompagnies_url
    click_on "New Armycompagny"

    fill_in "Name", with: @armycompagny.name
    click_on "Create Armycompagny"

    assert_text "Armycompagny was successfully created"
    click_on "Back"
  end

  test "updating a Armycompagny" do
    visit armycompagnies_url
    click_on "Edit", match: :first

    fill_in "Name", with: @armycompagny.name
    click_on "Update Armycompagny"

    assert_text "Armycompagny was successfully updated"
    click_on "Back"
  end

  test "destroying a Armycompagny" do
    visit armycompagnies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Armycompagny was successfully destroyed"
  end
end
