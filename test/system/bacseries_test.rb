require "application_system_test_case"

class BacseriesTest < ApplicationSystemTestCase
  setup do
    @bacseries = bacseries(:one)
  end

  test "visiting the index" do
    visit bacseries_url
    assert_selector "h1", text: "Bacseries"
  end

  test "creating a Bacserie" do
    visit bacseries_url
    click_on "New Bacserie"

    fill_in "Name", with: @bacseries.name
    click_on "Create Bacserie"

    assert_text "Bacserie was successfully created"
    click_on "Back"
  end

  test "updating a Bacserie" do
    visit bacseries_url
    click_on "Edit", match: :first

    fill_in "Name", with: @bacseries.name
    click_on "Update Bacserie"

    assert_text "Bacserie was successfully updated"
    click_on "Back"
  end

  test "destroying a Bacserie" do
    visit bacseries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bacserie was successfully destroyed"
  end
end
