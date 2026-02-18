require "application_system_test_case"

class TravelticketsTest < ApplicationSystemTestCase
  setup do
    @travelticket = traveltickets(:one)
  end

  test "visiting the index" do
    visit traveltickets_url
    assert_selector "h1", text: "Traveltickets"
  end

  test "creating a Travelticket" do
    visit traveltickets_url
    click_on "New Travelticket"

    fill_in "Image", with: @travelticket.image
    fill_in "Name de", with: @travelticket.name_de
    fill_in "Name en", with: @travelticket.name_en
    fill_in "Name fr", with: @travelticket.name_fr
    click_on "Create Travelticket"

    assert_text "Travelticket was successfully created"
    click_on "Back"
  end

  test "updating a Travelticket" do
    visit traveltickets_url
    click_on "Edit", match: :first

    fill_in "Image", with: @travelticket.image
    fill_in "Name de", with: @travelticket.name_de
    fill_in "Name en", with: @travelticket.name_en
    fill_in "Name fr", with: @travelticket.name_fr
    click_on "Update Travelticket"

    assert_text "Travelticket was successfully updated"
    click_on "Back"
  end

  test "destroying a Travelticket" do
    visit traveltickets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Travelticket was successfully destroyed"
  end
end
