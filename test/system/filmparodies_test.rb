require "application_system_test_case"

class FilmparodiesTest < ApplicationSystemTestCase
  setup do
    @filmparody = filmparodies(:one)
  end

  test "visiting the index" do
    visit filmparodies_url
    assert_selector "h1", text: "Filmparodies"
  end

  test "creating a Filmparodie" do
    visit filmparodies_url
    click_on "New Filmparodie"

    fill_in "Image", with: @filmparody.image
    fill_in "Name de", with: @filmparody.name_de
    fill_in "Name en", with: @filmparody.name_en
    fill_in "Name fr", with: @filmparody.name_fr
    click_on "Create Filmparodie"

    assert_text "Filmparodie was successfully created"
    click_on "Back"
  end

  test "updating a Filmparodie" do
    visit filmparodies_url
    click_on "Edit", match: :first

    fill_in "Image", with: @filmparody.image
    fill_in "Name de", with: @filmparody.name_de
    fill_in "Name en", with: @filmparody.name_en
    fill_in "Name fr", with: @filmparody.name_fr
    click_on "Update Filmparodie"

    assert_text "Filmparodie was successfully updated"
    click_on "Back"
  end

  test "destroying a Filmparodie" do
    visit filmparodies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Filmparodie was successfully destroyed"
  end
end
