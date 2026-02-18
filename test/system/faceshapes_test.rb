require "application_system_test_case"

class FaceshapesTest < ApplicationSystemTestCase
  setup do
    @faceshape = faceshapes(:one)
  end

  test "visiting the index" do
    visit faceshapes_url
    assert_selector "h1", text: "Faceshapes"
  end

  test "creating a Faceshape" do
    visit faceshapes_url
    click_on "New Faceshape"

    fill_in "Name", with: @faceshape.name
    click_on "Create Faceshape"

    assert_text "Faceshape was successfully created"
    click_on "Back"
  end

  test "updating a Faceshape" do
    visit faceshapes_url
    click_on "Edit", match: :first

    fill_in "Name", with: @faceshape.name
    click_on "Update Faceshape"

    assert_text "Faceshape was successfully updated"
    click_on "Back"
  end

  test "destroying a Faceshape" do
    visit faceshapes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Faceshape was successfully destroyed"
  end
end
