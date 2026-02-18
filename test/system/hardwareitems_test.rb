require "application_system_test_case"

class HardwareitemsTest < ApplicationSystemTestCase
  setup do
    @hardwareitem = hardwareitems(:one)
  end

  test "visiting the index" do
    visit hardwareitems_url
    assert_selector "h1", text: "Hardwareitems"
  end

  test "creating a Hardwareitem" do
    visit hardwareitems_url
    click_on "New Hardwareitem"

    fill_in "Image", with: @hardwareitem.image
    fill_in "Name", with: @hardwareitem.name
    click_on "Create Hardwareitem"

    assert_text "Hardwareitem was successfully created"
    click_on "Back"
  end

  test "updating a Hardwareitem" do
    visit hardwareitems_url
    click_on "Edit", match: :first

    fill_in "Image", with: @hardwareitem.image
    fill_in "Name", with: @hardwareitem.name
    click_on "Update Hardwareitem"

    assert_text "Hardwareitem was successfully updated"
    click_on "Back"
  end

  test "destroying a Hardwareitem" do
    visit hardwareitems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hardwareitem was successfully destroyed"
  end
end
