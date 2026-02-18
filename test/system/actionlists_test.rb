require "application_system_test_case"

class ActionlistsTest < ApplicationSystemTestCase
  setup do
    @actionlist = actionlists(:one)
  end

  test "visiting the index" do
    visit actionlists_url
    assert_selector "h1", text: "Actionlists"
  end

  test "creating a Actionlist" do
    visit actionlists_url
    click_on "New Actionlist"

    fill_in "Title de", with: @actionlist.title_de
    fill_in "Title en", with: @actionlist.title_en
    fill_in "Title fr", with: @actionlist.title_fr
    click_on "Create Actionlist"

    assert_text "Actionlist was successfully created"
    click_on "Back"
  end

  test "updating a Actionlist" do
    visit actionlists_url
    click_on "Edit", match: :first

    fill_in "Title de", with: @actionlist.title_de
    fill_in "Title en", with: @actionlist.title_en
    fill_in "Title fr", with: @actionlist.title_fr
    click_on "Update Actionlist"

    assert_text "Actionlist was successfully updated"
    click_on "Back"
  end

  test "destroying a Actionlist" do
    visit actionlists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Actionlist was successfully destroyed"
  end
end
