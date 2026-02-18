require "application_system_test_case"

class ClesTest < ApplicationSystemTestCase
  setup do
    @cle = cles(:one)
  end

  test "visiting the index" do
    visit cles_url
    assert_selector "h1", text: "Cles"
  end

  test "creating a Cle" do
    visit cles_url
    click_on "New Cle"

    fill_in "Armygrade", with: @cle.armygrade_id
    fill_in "Date", with: @cle.date
    fill_in "Observation", with: @cle.observation
    fill_in "Perception", with: @cle.perception
    fill_in "Person", with: @cle.person_id
    fill_in "Reintegration", with: @cle.reintegration
    click_on "Create Cle"

    assert_text "Cle was successfully created"
    click_on "Back"
  end

  test "updating a Cle" do
    visit cles_url
    click_on "Edit", match: :first

    fill_in "Armygrade", with: @cle.armygrade_id
    fill_in "Date", with: @cle.date
    fill_in "Observation", with: @cle.observation
    fill_in "Perception", with: @cle.perception
    fill_in "Person", with: @cle.person_id
    fill_in "Reintegration", with: @cle.reintegration
    click_on "Update Cle"

    assert_text "Cle was successfully updated"
    click_on "Back"
  end

  test "destroying a Cle" do
    visit cles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cle was successfully destroyed"
  end
end
