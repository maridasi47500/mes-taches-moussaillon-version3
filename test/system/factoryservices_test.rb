require "application_system_test_case"

class FactoryservicesTest < ApplicationSystemTestCase
  setup do
    @factoryservice = factoryservices(:one)
  end

  test "visiting the index" do
    visit factoryservices_url
    assert_selector "h1", text: "Factoryservices"
  end

  test "creating a Factoryservice" do
    visit factoryservices_url
    click_on "New Factoryservice"

    fill_in "Image", with: @factoryservice.image
    fill_in "Name", with: @factoryservice.name
    click_on "Create Factoryservice"

    assert_text "Factoryservice was successfully created"
    click_on "Back"
  end

  test "updating a Factoryservice" do
    visit factoryservices_url
    click_on "Edit", match: :first

    fill_in "Image", with: @factoryservice.image
    fill_in "Name", with: @factoryservice.name
    click_on "Update Factoryservice"

    assert_text "Factoryservice was successfully updated"
    click_on "Back"
  end

  test "destroying a Factoryservice" do
    visit factoryservices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Factoryservice was successfully destroyed"
  end
end
