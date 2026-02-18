require "application_system_test_case"

class NavettesTest < ApplicationSystemTestCase
  setup do
    @navette = navettes(:one)
  end

  test "visiting the index" do
    visit navettes_url
    assert_selector "h1", text: "Navettes"
  end

  test "creating a Navette" do
    visit navettes_url
    click_on "New Navette"

    check "Back" if @navette.back
    fill_in "Citya", with: @navette.citya_id
    fill_in "Cityb", with: @navette.cityb_id
    fill_in "Compagnie", with: @navette.compagnie_id
    check "Go" if @navette.go
    click_on "Create Navette"

    assert_text "Navette was successfully created"
    click_on "Back"
  end

  test "updating a Navette" do
    visit navettes_url
    click_on "Edit", match: :first

    check "Back" if @navette.back
    fill_in "Citya", with: @navette.citya_id
    fill_in "Cityb", with: @navette.cityb_id
    fill_in "Compagnie", with: @navette.compagnie_id
    check "Go" if @navette.go
    click_on "Update Navette"

    assert_text "Navette was successfully updated"
    click_on "Back"
  end

  test "destroying a Navette" do
    visit navettes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Navette was successfully destroyed"
  end
end
