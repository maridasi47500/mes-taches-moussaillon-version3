require "application_system_test_case"

class LinkpeopleTest < ApplicationSystemTestCase
  setup do
    @linkperson = linkpeople(:one)
  end

  test "visiting the index" do
    visit linkpeople_url
    assert_selector "h1", text: "Linkpeople"
  end

  test "creating a Linkperson" do
    visit linkpeople_url
    click_on "New Linkperson"

    fill_in "Name de", with: @linkperson.name_de
    fill_in "Name en", with: @linkperson.name_en
    fill_in "Name fr", with: @linkperson.name_fr
    click_on "Create Linkperson"

    assert_text "Linkperson was successfully created"
    click_on "Back"
  end

  test "updating a Linkperson" do
    visit linkpeople_url
    click_on "Edit", match: :first

    fill_in "Name de", with: @linkperson.name_de
    fill_in "Name en", with: @linkperson.name_en
    fill_in "Name fr", with: @linkperson.name_fr
    click_on "Update Linkperson"

    assert_text "Linkperson was successfully updated"
    click_on "Back"
  end

  test "destroying a Linkperson" do
    visit linkpeople_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Linkperson was successfully destroyed"
  end
end
