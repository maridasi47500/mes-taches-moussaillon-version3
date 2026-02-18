require "application_system_test_case"

class TvprogramsTest < ApplicationSystemTestCase
  setup do
    @tvprogram = tvprograms(:one)
  end

  test "visiting the index" do
    visit tvprograms_url
    assert_selector "h1", text: "Tvprograms"
  end

  test "creating a Tvprogram" do
    visit tvprograms_url
    click_on "New Tvprogram"

    fill_in "Image", with: @tvprogram.image
    fill_in "Name", with: @tvprogram.name
    click_on "Create Tvprogram"

    assert_text "Tvprogram was successfully created"
    click_on "Back"
  end

  test "updating a Tvprogram" do
    visit tvprograms_url
    click_on "Edit", match: :first

    fill_in "Image", with: @tvprogram.image
    fill_in "Name", with: @tvprogram.name
    click_on "Update Tvprogram"

    assert_text "Tvprogram was successfully updated"
    click_on "Back"
  end

  test "destroying a Tvprogram" do
    visit tvprograms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tvprogram was successfully destroyed"
  end
end
