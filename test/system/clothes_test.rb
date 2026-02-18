require "application_system_test_case"

class ClothesTest < ApplicationSystemTestCase
  setup do
    @clothing = clothes(:one)
  end

  test "visiting the index" do
    visit clothes_url
    assert_selector "h1", text: "Clothes"
  end

  test "creating a Clothing" do
    visit clothes_url
    click_on "New Clothing"

    fill_in "Image", with: @clothing.image
    fill_in "Name", with: @clothing.name
    click_on "Create Clothing"

    assert_text "Clothing was successfully created"
    click_on "Back"
  end

  test "updating a Clothing" do
    visit clothes_url
    click_on "Edit", match: :first

    fill_in "Image", with: @clothing.image
    fill_in "Name", with: @clothing.name
    click_on "Update Clothing"

    assert_text "Clothing was successfully updated"
    click_on "Back"
  end

  test "destroying a Clothing" do
    visit clothes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Clothing was successfully destroyed"
  end
end
