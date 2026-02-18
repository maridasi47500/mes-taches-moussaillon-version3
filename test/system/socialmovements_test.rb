require "application_system_test_case"

class SocialmovementsTest < ApplicationSystemTestCase
  setup do
    @socialmovement = socialmovements(:one)
  end

  test "visiting the index" do
    visit socialmovements_url
    assert_selector "h1", text: "Socialmovements"
  end

  test "creating a Socialmovement" do
    visit socialmovements_url
    click_on "New Socialmovement"

    fill_in "Image", with: @socialmovement.image
    fill_in "Name", with: @socialmovement.name
    click_on "Create Socialmovement"

    assert_text "Socialmovement was successfully created"
    click_on "Back"
  end

  test "updating a Socialmovement" do
    visit socialmovements_url
    click_on "Edit", match: :first

    fill_in "Image", with: @socialmovement.image
    fill_in "Name", with: @socialmovement.name
    click_on "Update Socialmovement"

    assert_text "Socialmovement was successfully updated"
    click_on "Back"
  end

  test "destroying a Socialmovement" do
    visit socialmovements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Socialmovement was successfully destroyed"
  end
end
