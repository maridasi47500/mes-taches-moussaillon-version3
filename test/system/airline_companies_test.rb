require "application_system_test_case"

class AirlineCompaniesTest < ApplicationSystemTestCase
  setup do
    @airline_company = airline_companies(:one)
  end

  test "visiting the index" do
    visit airline_companies_url
    assert_selector "h1", text: "Airline Companies"
  end

  test "creating a Airline company" do
    visit airline_companies_url
    click_on "New Airline Company"

    fill_in "Name de", with: @airline_company.name_de
    fill_in "Name en", with: @airline_company.name_en
    fill_in "Name fr", with: @airline_company.name_fr
    click_on "Create Airline company"

    assert_text "Airline company was successfully created"
    click_on "Back"
  end

  test "updating a Airline company" do
    visit airline_companies_url
    click_on "Edit", match: :first

    fill_in "Name de", with: @airline_company.name_de
    fill_in "Name en", with: @airline_company.name_en
    fill_in "Name fr", with: @airline_company.name_fr
    click_on "Update Airline company"

    assert_text "Airline company was successfully updated"
    click_on "Back"
  end

  test "destroying a Airline company" do
    visit airline_companies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Airline company was successfully destroyed"
  end
end
