require "application_system_test_case"

class EtnicitiesTest < ApplicationSystemTestCase
  setup do
    @etnicity = etnicities(:one)
  end

  test "visiting the index" do
    visit etnicities_url
    assert_selector "h1", text: "Etnicities"
  end

  test "creating a Etnicity" do
    visit etnicities_url
    click_on "New Etnicity"

    fill_in "Image", with: @etnicity.image
    fill_in "Name", with: @etnicity.name
    click_on "Create Etnicity"

    assert_text "Etnicity was successfully created"
    click_on "Back"
  end

  test "updating a Etnicity" do
    visit etnicities_url
    click_on "Edit", match: :first

    fill_in "Image", with: @etnicity.image
    fill_in "Name", with: @etnicity.name
    click_on "Update Etnicity"

    assert_text "Etnicity was successfully updated"
    click_on "Back"
  end

  test "destroying a Etnicity" do
    visit etnicities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Etnicity was successfully destroyed"
  end
end
