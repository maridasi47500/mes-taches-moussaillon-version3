require "application_system_test_case"

class TvseriesparodiesTest < ApplicationSystemTestCase
  setup do
    @tvseriesparody = tvseriesparodies(:one)
  end

  test "visiting the index" do
    visit tvseriesparodies_url
    assert_selector "h1", text: "Tvseriesparodies"
  end

  test "creating a Tvseriesparodie" do
    visit tvseriesparodies_url
    click_on "New Tvseriesparodie"

    fill_in "Image", with: @tvseriesparody.image
    fill_in "Name de", with: @tvseriesparody.name_de
    fill_in "Name en", with: @tvseriesparody.name_en
    fill_in "Name fr", with: @tvseriesparody.name_fr
    click_on "Create Tvseriesparodie"

    assert_text "Tvseriesparodie was successfully created"
    click_on "Back"
  end

  test "updating a Tvseriesparodie" do
    visit tvseriesparodies_url
    click_on "Edit", match: :first

    fill_in "Image", with: @tvseriesparody.image
    fill_in "Name de", with: @tvseriesparody.name_de
    fill_in "Name en", with: @tvseriesparody.name_en
    fill_in "Name fr", with: @tvseriesparody.name_fr
    click_on "Update Tvseriesparodie"

    assert_text "Tvseriesparodie was successfully updated"
    click_on "Back"
  end

  test "destroying a Tvseriesparodie" do
    visit tvseriesparodies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tvseriesparodie was successfully destroyed"
  end
end
