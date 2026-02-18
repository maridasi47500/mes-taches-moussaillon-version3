require "application_system_test_case"

class InternetpseudonymsTest < ApplicationSystemTestCase
  setup do
    @internetpseudonym = internetpseudonyms(:one)
  end

  test "visiting the index" do
    visit internetpseudonyms_url
    assert_selector "h1", text: "Internetpseudonyms"
  end

  test "creating a Internetpseudonym" do
    visit internetpseudonyms_url
    click_on "New Internetpseudonym"

    click_on "Create Internetpseudonym"

    assert_text "Internetpseudonym was successfully created"
    click_on "Back"
  end

  test "updating a Internetpseudonym" do
    visit internetpseudonyms_url
    click_on "Edit", match: :first

    click_on "Update Internetpseudonym"

    assert_text "Internetpseudonym was successfully updated"
    click_on "Back"
  end

  test "destroying a Internetpseudonym" do
    visit internetpseudonyms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Internetpseudonym was successfully destroyed"
  end
end
