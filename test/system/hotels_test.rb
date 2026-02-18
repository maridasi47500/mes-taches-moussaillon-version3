require "application_system_test_case"

class HotelsTest < ApplicationSystemTestCase
  setup do
    @hotel = hotels(:one)
  end

  test "visiting the index" do
    visit hotels_url
    assert_selector "h1", text: "Hotels"
  end

  test "creating a Hotel" do
    visit hotels_url
    click_on "New Hotel"

    fill_in "City", with: @hotel.city_id
    fill_in "Country", with: @hotel.country_id
    fill_in "Description", with: @hotel.description
    fill_in "Image", with: @hotel.image
    fill_in "Latitude", with: @hotel.latitude
    fill_in "Longitude", with: @hotel.longitude
    fill_in "Name", with: @hotel.name
    fill_in "Place", with: @hotel.place_id
    fill_in "State", with: @hotel.state_id
    click_on "Create Hotel"

    assert_text "Hotel was successfully created"
    click_on "Back"
  end

  test "updating a Hotel" do
    visit hotels_url
    click_on "Edit", match: :first

    fill_in "City", with: @hotel.city_id
    fill_in "Country", with: @hotel.country_id
    fill_in "Description", with: @hotel.description
    fill_in "Image", with: @hotel.image
    fill_in "Latitude", with: @hotel.latitude
    fill_in "Longitude", with: @hotel.longitude
    fill_in "Name", with: @hotel.name
    fill_in "Place", with: @hotel.place_id
    fill_in "State", with: @hotel.state_id
    click_on "Update Hotel"

    assert_text "Hotel was successfully updated"
    click_on "Back"
  end

  test "destroying a Hotel" do
    visit hotels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hotel was successfully destroyed"
  end
end
