require "application_system_test_case"

class EpochsTest < ApplicationSystemTestCase
  setup do
    @epoch = epochs(:one)
  end

  test "visiting the index" do
    visit epochs_url
    assert_selector "h1", text: "Epochs"
  end

  test "creating a Epoch" do
    visit epochs_url
    click_on "New Epoch"

    fill_in "Address", with: @epoch.address
    fill_in "City", with: @epoch.city_id
    fill_in "Country", with: @epoch.country_id
    fill_in "Created at", with: @epoch.created_at
    fill_in "Description", with: @epoch.description
    fill_in "Done", with: @epoch.done
    fill_in "End at", with: @epoch.end_at
    fill_in "Event type", with: @epoch.event_type_id
    fill_in "Idoit", with: @epoch.idoit
    fill_in "Image", with: @epoch.image
    fill_in "Latitude", with: @epoch.latitude
    fill_in "Longitude", with: @epoch.longitude
    fill_in "Name", with: @epoch.name
    fill_in "Nbtimes", with: @epoch.nbtimes
    fill_in "Place", with: @epoch.place_id
    fill_in "Start at", with: @epoch.start_at
    fill_in "State", with: @epoch.state_id
    fill_in "Type", with: @epoch.type
    fill_in "Updated at", with: @epoch.updated_at
    fill_in "Zoom", with: @epoch.zoom
    click_on "Create Epoch"

    assert_text "Epoch was successfully created"
    click_on "Back"
  end

  test "updating a Epoch" do
    visit epochs_url
    click_on "Edit", match: :first

    fill_in "Address", with: @epoch.address
    fill_in "City", with: @epoch.city_id
    fill_in "Country", with: @epoch.country_id
    fill_in "Created at", with: @epoch.created_at
    fill_in "Description", with: @epoch.description
    fill_in "Done", with: @epoch.done
    fill_in "End at", with: @epoch.end_at
    fill_in "Event type", with: @epoch.event_type_id
    fill_in "Idoit", with: @epoch.idoit
    fill_in "Image", with: @epoch.image
    fill_in "Latitude", with: @epoch.latitude
    fill_in "Longitude", with: @epoch.longitude
    fill_in "Name", with: @epoch.name
    fill_in "Nbtimes", with: @epoch.nbtimes
    fill_in "Place", with: @epoch.place_id
    fill_in "Start at", with: @epoch.start_at
    fill_in "State", with: @epoch.state_id
    fill_in "Type", with: @epoch.type
    fill_in "Updated at", with: @epoch.updated_at
    fill_in "Zoom", with: @epoch.zoom
    click_on "Update Epoch"

    assert_text "Epoch was successfully updated"
    click_on "Back"
  end

  test "destroying a Epoch" do
    visit epochs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Epoch was successfully destroyed"
  end
end
