require "application_system_test_case"

class FrontpagesTest < ApplicationSystemTestCase
  setup do
    @frontpage = frontpages(:one)
  end

  test "visiting the index" do
    visit frontpages_url
    assert_selector "h1", text: "Frontpages"
  end

  test "creating a Frontpage" do
    visit frontpages_url
    click_on "New Frontpage"

    click_on "Create Frontpage"

    assert_text "Frontpage was successfully created"
    click_on "Back"
  end

  test "updating a Frontpage" do
    visit frontpages_url
    click_on "Edit", match: :first

    click_on "Update Frontpage"

    assert_text "Frontpage was successfully updated"
    click_on "Back"
  end

  test "destroying a Frontpage" do
    visit frontpages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Frontpage was successfully destroyed"
  end
end
