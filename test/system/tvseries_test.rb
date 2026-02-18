require "application_system_test_case"

class TvseriesTest < ApplicationSystemTestCase
  setup do
    @tvseries = tvseries(:one)
  end

  test "visiting the index" do
    visit tvseries_url
    assert_selector "h1", text: "Tvseries"
  end

  test "creating a Tvseries" do
    visit tvseries_url
    click_on "New Tvseries"

    fill_in "Description", with: @tvseries.description
    fill_in "Image", with: @tvseries.image
    fill_in "Name", with: @tvseries.name
    click_on "Create Tvseries"

    assert_text "Tvseries was successfully created"
    click_on "Back"
  end

  test "updating a Tvseries" do
    visit tvseries_url
    click_on "Edit", match: :first

    fill_in "Description", with: @tvseries.description
    fill_in "Image", with: @tvseries.image
    fill_in "Name", with: @tvseries.name
    click_on "Update Tvseries"

    assert_text "Tvseries was successfully updated"
    click_on "Back"
  end

  test "destroying a Tvseries" do
    visit tvseries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tvseries was successfully destroyed"
  end
end
