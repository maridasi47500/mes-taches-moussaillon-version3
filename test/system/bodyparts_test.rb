require "application_system_test_case"

class BodypartsTest < ApplicationSystemTestCase
  setup do
    @bodypart = bodyparts(:one)
  end

  test "visiting the index" do
    visit bodyparts_url
    assert_selector "h1", text: "Bodyparts"
  end

  test "creating a Bodypart" do
    visit bodyparts_url
    click_on "New Bodypart"

    fill_in "Image", with: @bodypart.image
    fill_in "Name de", with: @bodypart.name_de
    fill_in "Name en", with: @bodypart.name_en
    fill_in "Name fr", with: @bodypart.name_fr
    click_on "Create Bodypart"

    assert_text "Bodypart was successfully created"
    click_on "Back"
  end

  test "updating a Bodypart" do
    visit bodyparts_url
    click_on "Edit", match: :first

    fill_in "Image", with: @bodypart.image
    fill_in "Name de", with: @bodypart.name_de
    fill_in "Name en", with: @bodypart.name_en
    fill_in "Name fr", with: @bodypart.name_fr
    click_on "Update Bodypart"

    assert_text "Bodypart was successfully updated"
    click_on "Back"
  end

  test "destroying a Bodypart" do
    visit bodyparts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bodypart was successfully destroyed"
  end
end
