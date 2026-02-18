require "application_system_test_case"

class PhotoshavethingsTest < ApplicationSystemTestCase
  setup do
    @photoshavething = photoshavethings(:one)
  end

  test "visiting the index" do
    visit photoshavethings_url
    assert_selector "h1", text: "Photoshavethings"
  end

  test "creating a Photoshavething" do
    visit photoshavethings_url
    click_on "New Photoshavething"

    fill_in "Photo", with: @photoshavething.photo_id
    fill_in "Thing", with: @photoshavething.thing_id
    click_on "Create Photoshavething"

    assert_text "Photoshavething was successfully created"
    click_on "Back"
  end

  test "updating a Photoshavething" do
    visit photoshavethings_url
    click_on "Edit", match: :first

    fill_in "Photo", with: @photoshavething.photo_id
    fill_in "Thing", with: @photoshavething.thing_id
    click_on "Update Photoshavething"

    assert_text "Photoshavething was successfully updated"
    click_on "Back"
  end

  test "destroying a Photoshavething" do
    visit photoshavethings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Photoshavething was successfully destroyed"
  end
end
