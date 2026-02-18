require "application_system_test_case"

class MymapscoordsTest < ApplicationSystemTestCase
  setup do
    @mymapscoord = mymapscoords(:one)
  end

  test "visiting the index" do
    visit mymapscoords_url
    assert_selector "h1", text: "Mymapscoords"
  end

  test "creating a Mymapscoord" do
    visit mymapscoords_url
    click_on "New Mymapscoord"

    fill_in "Mymap", with: @mymapscoord.mymap_id
    fill_in "Tagx", with: @mymapscoord.tagx
    fill_in "Tagy", with: @mymapscoord.tagy
    click_on "Create Mymapscoord"

    assert_text "Mymapscoord was successfully created"
    click_on "Back"
  end

  test "updating a Mymapscoord" do
    visit mymapscoords_url
    click_on "Edit", match: :first

    fill_in "Mymap", with: @mymapscoord.mymap_id
    fill_in "Tagx", with: @mymapscoord.tagx
    fill_in "Tagy", with: @mymapscoord.tagy
    click_on "Update Mymapscoord"

    assert_text "Mymapscoord was successfully updated"
    click_on "Back"
  end

  test "destroying a Mymapscoord" do
    visit mymapscoords_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mymapscoord was successfully destroyed"
  end
end
