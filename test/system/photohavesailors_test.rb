require "application_system_test_case"

class PhotohavesailorsTest < ApplicationSystemTestCase
  setup do
    @photohavesailor = photohavesailors(:one)
  end

  test "visiting the index" do
    visit photohavesailors_url
    assert_selector "h1", text: "Photohavesailors"
  end

  test "creating a Photohavesailor" do
    visit photohavesailors_url
    click_on "New Photohavesailor"

    click_on "Create Photohavesailor"

    assert_text "Photohavesailor was successfully created"
    click_on "Back"
  end

  test "updating a Photohavesailor" do
    visit photohavesailors_url
    click_on "Edit", match: :first

    click_on "Update Photohavesailor"

    assert_text "Photohavesailor was successfully updated"
    click_on "Back"
  end

  test "destroying a Photohavesailor" do
    visit photohavesailors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Photohavesailor was successfully destroyed"
  end
end
