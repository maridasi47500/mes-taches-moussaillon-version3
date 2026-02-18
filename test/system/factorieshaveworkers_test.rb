require "application_system_test_case"

class FactorieshaveworkersTest < ApplicationSystemTestCase
  setup do
    @factorieshaveworker = factorieshaveworkers(:one)
  end

  test "visiting the index" do
    visit factorieshaveworkers_url
    assert_selector "h1", text: "Factorieshaveworkers"
  end

  test "creating a Factorieshaveworker" do
    visit factorieshaveworkers_url
    click_on "New Factorieshaveworker"

    click_on "Create Factorieshaveworker"

    assert_text "Factorieshaveworker was successfully created"
    click_on "Back"
  end

  test "updating a Factorieshaveworker" do
    visit factorieshaveworkers_url
    click_on "Edit", match: :first

    click_on "Update Factorieshaveworker"

    assert_text "Factorieshaveworker was successfully updated"
    click_on "Back"
  end

  test "destroying a Factorieshaveworker" do
    visit factorieshaveworkers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Factorieshaveworker was successfully destroyed"
  end
end
