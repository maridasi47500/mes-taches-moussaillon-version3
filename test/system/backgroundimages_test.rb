require "application_system_test_case"

class BackgroundimagesTest < ApplicationSystemTestCase
  setup do
    @backgroundimage = backgroundimages(:one)
  end

  test "visiting the index" do
    visit backgroundimages_url
    assert_selector "h1", text: "Backgroundimages"
  end

  test "creating a Backgroundimage" do
    visit backgroundimages_url
    click_on "New Backgroundimage"

    fill_in "Image", with: @backgroundimage.image
    fill_in "Type", with: @backgroundimage.type
    fill_in "Url", with: @backgroundimage.url
    click_on "Create Backgroundimage"

    assert_text "Backgroundimage was successfully created"
    click_on "Back"
  end

  test "updating a Backgroundimage" do
    visit backgroundimages_url
    click_on "Edit", match: :first

    fill_in "Image", with: @backgroundimage.image
    fill_in "Type", with: @backgroundimage.type
    fill_in "Url", with: @backgroundimage.url
    click_on "Update Backgroundimage"

    assert_text "Backgroundimage was successfully updated"
    click_on "Back"
  end

  test "destroying a Backgroundimage" do
    visit backgroundimages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Backgroundimage was successfully destroyed"
  end
end
