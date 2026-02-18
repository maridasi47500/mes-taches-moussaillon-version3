require "application_system_test_case"

class LifestatesTest < ApplicationSystemTestCase
  setup do
    @lifestate = lifestates(:one)
  end

  test "visiting the index" do
    visit lifestates_url
    assert_selector "h1", text: "Lifestates"
  end

  test "creating a Lifestate" do
    visit lifestates_url
    click_on "New Lifestate"

    fill_in "Name de", with: @lifestate.name_de
    fill_in "Name en", with: @lifestate.name_en
    fill_in "Name fr", with: @lifestate.name_fr
    click_on "Create Lifestate"

    assert_text "Lifestate was successfully created"
    click_on "Back"
  end

  test "updating a Lifestate" do
    visit lifestates_url
    click_on "Edit", match: :first

    fill_in "Name de", with: @lifestate.name_de
    fill_in "Name en", with: @lifestate.name_en
    fill_in "Name fr", with: @lifestate.name_fr
    click_on "Update Lifestate"

    assert_text "Lifestate was successfully updated"
    click_on "Back"
  end

  test "destroying a Lifestate" do
    visit lifestates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lifestate was successfully destroyed"
  end
end
