require "application_system_test_case"

class ArtobjectsTest < ApplicationSystemTestCase
  setup do
    @artobject = artobjects(:one)
  end

  test "visiting the index" do
    visit artobjects_url
    assert_selector "h1", text: "Artobjects"
  end

  test "creating a Artobject" do
    visit artobjects_url
    click_on "New Artobject"

    fill_in "Image", with: @artobject.image
    fill_in "Name", with: @artobject.name
    click_on "Create Artobject"

    assert_text "Artobject was successfully created"
    click_on "Back"
  end

  test "updating a Artobject" do
    visit artobjects_url
    click_on "Edit", match: :first

    fill_in "Image", with: @artobject.image
    fill_in "Name", with: @artobject.name
    click_on "Update Artobject"

    assert_text "Artobject was successfully updated"
    click_on "Back"
  end

  test "destroying a Artobject" do
    visit artobjects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Artobject was successfully destroyed"
  end
end
