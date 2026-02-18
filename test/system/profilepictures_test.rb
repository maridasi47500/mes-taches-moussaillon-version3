require "application_system_test_case"

class ProfilepicturesTest < ApplicationSystemTestCase
  setup do
    @profilepicture = profilepictures(:one)
  end

  test "visiting the index" do
    visit profilepictures_url
    assert_selector "h1", text: "Profilepictures"
  end

  test "creating a Profilepicture" do
    visit profilepictures_url
    click_on "New Profilepicture"

    fill_in "Name", with: @profilepicture.name
    fill_in "Nameimage", with: @profilepicture.nameimage
    click_on "Create Profilepicture"

    assert_text "Profilepicture was successfully created"
    click_on "Back"
  end

  test "updating a Profilepicture" do
    visit profilepictures_url
    click_on "Edit", match: :first

    fill_in "Name", with: @profilepicture.name
    fill_in "Nameimage", with: @profilepicture.nameimage
    click_on "Update Profilepicture"

    assert_text "Profilepicture was successfully updated"
    click_on "Back"
  end

  test "destroying a Profilepicture" do
    visit profilepictures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Profilepicture was successfully destroyed"
  end
end
