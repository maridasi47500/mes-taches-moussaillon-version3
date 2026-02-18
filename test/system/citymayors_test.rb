require "application_system_test_case"

class CitymayorsTest < ApplicationSystemTestCase
  setup do
    @citymayor = citymayors(:one)
  end

  test "visiting the index" do
    visit citymayors_url
    assert_selector "h1", text: "Citymayors"
  end

  test "creating a Citymayor" do
    visit citymayors_url
    click_on "New Citymayor"

    click_on "Create Citymayor"

    assert_text "Citymayor was successfully created"
    click_on "Back"
  end

  test "updating a Citymayor" do
    visit citymayors_url
    click_on "Edit", match: :first

    click_on "Update Citymayor"

    assert_text "Citymayor was successfully updated"
    click_on "Back"
  end

  test "destroying a Citymayor" do
    visit citymayors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Citymayor was successfully destroyed"
  end
end
