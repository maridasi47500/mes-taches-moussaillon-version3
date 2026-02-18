require "application_system_test_case"

class MakeupstylesTest < ApplicationSystemTestCase
  setup do
    @makeupstyle = makeupstyles(:one)
  end

  test "visiting the index" do
    visit makeupstyles_url
    assert_selector "h1", text: "Makeupstyles"
  end

  test "creating a Makeupstyle" do
    visit makeupstyles_url
    click_on "New Makeupstyle"

    fill_in "Name", with: @makeupstyle.name
    click_on "Create Makeupstyle"

    assert_text "Makeupstyle was successfully created"
    click_on "Back"
  end

  test "updating a Makeupstyle" do
    visit makeupstyles_url
    click_on "Edit", match: :first

    fill_in "Name", with: @makeupstyle.name
    click_on "Update Makeupstyle"

    assert_text "Makeupstyle was successfully updated"
    click_on "Back"
  end

  test "destroying a Makeupstyle" do
    visit makeupstyles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Makeupstyle was successfully destroyed"
  end
end
