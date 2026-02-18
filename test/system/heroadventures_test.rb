require "application_system_test_case"

class HeroadventuresTest < ApplicationSystemTestCase
  setup do
    @heroadventure = heroadventures(:one)
  end

  test "visiting the index" do
    visit heroadventures_url
    assert_selector "h1", text: "Heroadventures"
  end

  test "creating a Heroadventure" do
    visit heroadventures_url
    click_on "New Heroadventure"

    click_on "Create Heroadventure"

    assert_text "Heroadventure was successfully created"
    click_on "Back"
  end

  test "updating a Heroadventure" do
    visit heroadventures_url
    click_on "Edit", match: :first

    click_on "Update Heroadventure"

    assert_text "Heroadventure was successfully updated"
    click_on "Back"
  end

  test "destroying a Heroadventure" do
    visit heroadventures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Heroadventure was successfully destroyed"
  end
end
