require "application_system_test_case"

class CategorythingsTest < ApplicationSystemTestCase
  setup do
    @categorything = categorythings(:one)
  end

  test "visiting the index" do
    visit categorythings_url
    assert_selector "h1", text: "Categorythings"
  end

  test "creating a Categorything" do
    visit categorythings_url
    click_on "New Categorything"

    fill_in "Image", with: @categorything.image
    fill_in "Name de", with: @categorything.name_de
    fill_in "Name en", with: @categorything.name_en
    fill_in "Name fr", with: @categorything.name_fr
    click_on "Create Categorything"

    assert_text "Categorything was successfully created"
    click_on "Back"
  end

  test "updating a Categorything" do
    visit categorythings_url
    click_on "Edit", match: :first

    fill_in "Image", with: @categorything.image
    fill_in "Name de", with: @categorything.name_de
    fill_in "Name en", with: @categorything.name_en
    fill_in "Name fr", with: @categorything.name_fr
    click_on "Update Categorything"

    assert_text "Categorything was successfully updated"
    click_on "Back"
  end

  test "destroying a Categorything" do
    visit categorythings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Categorything was successfully destroyed"
  end
end
