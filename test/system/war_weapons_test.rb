require "application_system_test_case"

class WarWeaponsTest < ApplicationSystemTestCase
  setup do
    @war_weapon = war_weapons(:one)
  end

  test "visiting the index" do
    visit war_weapons_url
    assert_selector "h1", text: "War Weapons"
  end

  test "creating a War weapon" do
    visit war_weapons_url
    click_on "New War Weapon"

    fill_in "Image", with: @war_weapon.image
    fill_in "Name", with: @war_weapon.name
    click_on "Create War weapon"

    assert_text "War weapon was successfully created"
    click_on "Back"
  end

  test "updating a War weapon" do
    visit war_weapons_url
    click_on "Edit", match: :first

    fill_in "Image", with: @war_weapon.image
    fill_in "Name", with: @war_weapon.name
    click_on "Update War weapon"

    assert_text "War weapon was successfully updated"
    click_on "Back"
  end

  test "destroying a War weapon" do
    visit war_weapons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "War weapon was successfully destroyed"
  end
end
