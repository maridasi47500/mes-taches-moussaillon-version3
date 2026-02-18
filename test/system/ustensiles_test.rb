require "application_system_test_case"

class UstensilesTest < ApplicationSystemTestCase
  setup do
    @ustensile = ustensiles(:one)
  end

  test "visiting the index" do
    visit ustensiles_url
    assert_selector "h1", text: "Ustensiles"
  end

  test "creating a Ustensile" do
    visit ustensiles_url
    click_on "New Ustensile"

    fill_in "Image", with: @ustensile.image
    fill_in "Name", with: @ustensile.name
    click_on "Create Ustensile"

    assert_text "Ustensile was successfully created"
    click_on "Back"
  end

  test "updating a Ustensile" do
    visit ustensiles_url
    click_on "Edit", match: :first

    fill_in "Image", with: @ustensile.image
    fill_in "Name", with: @ustensile.name
    click_on "Update Ustensile"

    assert_text "Ustensile was successfully updated"
    click_on "Back"
  end

  test "destroying a Ustensile" do
    visit ustensiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ustensile was successfully destroyed"
  end
end
