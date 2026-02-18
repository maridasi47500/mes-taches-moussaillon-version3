require "application_system_test_case"

class SoftwareitemsTest < ApplicationSystemTestCase
  setup do
    @softwareitem = softwareitems(:one)
  end

  test "visiting the index" do
    visit softwareitems_url
    assert_selector "h1", text: "Softwareitems"
  end

  test "creating a Softwareitem" do
    visit softwareitems_url
    click_on "New Softwareitem"

    fill_in "Image", with: @softwareitem.image
    fill_in "Name", with: @softwareitem.name
    click_on "Create Softwareitem"

    assert_text "Softwareitem was successfully created"
    click_on "Back"
  end

  test "updating a Softwareitem" do
    visit softwareitems_url
    click_on "Edit", match: :first

    fill_in "Image", with: @softwareitem.image
    fill_in "Name", with: @softwareitem.name
    click_on "Update Softwareitem"

    assert_text "Softwareitem was successfully updated"
    click_on "Back"
  end

  test "destroying a Softwareitem" do
    visit softwareitems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Softwareitem was successfully destroyed"
  end
end
