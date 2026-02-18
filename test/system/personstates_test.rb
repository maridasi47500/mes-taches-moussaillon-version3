require "application_system_test_case"

class PersonstatesTest < ApplicationSystemTestCase
  setup do
    @personstate = personstates(:one)
  end

  test "visiting the index" do
    visit personstates_url
    assert_selector "h1", text: "Personstates"
  end

  test "creating a Personstate" do
    visit personstates_url
    click_on "New Personstate"

    fill_in "State de", with: @personstate.state_de
    fill_in "State en", with: @personstate.state_en
    fill_in "State fr", with: @personstate.state_fr
    click_on "Create Personstate"

    assert_text "Personstate was successfully created"
    click_on "Back"
  end

  test "updating a Personstate" do
    visit personstates_url
    click_on "Edit", match: :first

    fill_in "State de", with: @personstate.state_de
    fill_in "State en", with: @personstate.state_en
    fill_in "State fr", with: @personstate.state_fr
    click_on "Update Personstate"

    assert_text "Personstate was successfully updated"
    click_on "Back"
  end

  test "destroying a Personstate" do
    visit personstates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personstate was successfully destroyed"
  end
end
