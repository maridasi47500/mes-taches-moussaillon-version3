require "application_system_test_case"

class ReligionsTest < ApplicationSystemTestCase
  setup do
    @religion = religions(:one)
  end

  test "visiting the index" do
    visit religions_url
    assert_selector "h1", text: "Religions"
  end

  test "creating a Religion" do
    visit religions_url
    click_on "New Religion"

    fill_in "Image", with: @religion.image
    fill_in "Name", with: @religion.name
    click_on "Create Religion"

    assert_text "Religion was successfully created"
    click_on "Back"
  end

  test "updating a Religion" do
    visit religions_url
    click_on "Edit", match: :first

    fill_in "Image", with: @religion.image
    fill_in "Name", with: @religion.name
    click_on "Update Religion"

    assert_text "Religion was successfully updated"
    click_on "Back"
  end

  test "destroying a Religion" do
    visit religions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Religion was successfully destroyed"
  end
end
