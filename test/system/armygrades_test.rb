require "application_system_test_case"

class ArmygradesTest < ApplicationSystemTestCase
  setup do
    @armygrade = armygrades(:one)
  end

  test "visiting the index" do
    visit armygrades_url
    assert_selector "h1", text: "Armygrades"
  end

  test "creating a Armygrade" do
    visit armygrades_url
    click_on "New Armygrade"

    fill_in "Appellation", with: @armygrade.appellation
    fill_in "Image", with: @armygrade.image
    fill_in "Nom", with: @armygrade.nom
    click_on "Create Armygrade"

    assert_text "Armygrade was successfully created"
    click_on "Back"
  end

  test "updating a Armygrade" do
    visit armygrades_url
    click_on "Edit", match: :first

    fill_in "Appellation", with: @armygrade.appellation
    fill_in "Image", with: @armygrade.image
    fill_in "Nom", with: @armygrade.nom
    click_on "Update Armygrade"

    assert_text "Armygrade was successfully updated"
    click_on "Back"
  end

  test "destroying a Armygrade" do
    visit armygrades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Armygrade was successfully destroyed"
  end
end
