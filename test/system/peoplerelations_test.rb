require "application_system_test_case"

class PeoplerelationsTest < ApplicationSystemTestCase
  setup do
    @peoplerelation = peoplerelations(:one)
  end

  test "visiting the index" do
    visit peoplerelations_url
    assert_selector "h1", text: "Peoplerelations"
  end

  test "creating a Peoplerelation" do
    visit peoplerelations_url
    click_on "New Peoplerelation"

    fill_in "Name", with: @peoplerelation.name
    click_on "Create Peoplerelation"

    assert_text "Peoplerelation was successfully created"
    click_on "Back"
  end

  test "updating a Peoplerelation" do
    visit peoplerelations_url
    click_on "Edit", match: :first

    fill_in "Name", with: @peoplerelation.name
    click_on "Update Peoplerelation"

    assert_text "Peoplerelation was successfully updated"
    click_on "Back"
  end

  test "destroying a Peoplerelation" do
    visit peoplerelations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Peoplerelation was successfully destroyed"
  end
end
