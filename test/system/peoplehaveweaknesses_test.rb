require "application_system_test_case"

class PeoplehaveweaknessesTest < ApplicationSystemTestCase
  setup do
    @peoplehaveweakness = peoplehaveweaknesses(:one)
  end

  test "visiting the index" do
    visit peoplehaveweaknesses_url
    assert_selector "h1", text: "Peoplehaveweaknesses"
  end

  test "creating a Peoplehaveweakness" do
    visit peoplehaveweaknesses_url
    click_on "New Peoplehaveweakness"

    fill_in "Linkspouseperson", with: @peoplehaveweakness.linkspouseperson_id
    fill_in "Person", with: @peoplehaveweakness.person_id
    fill_in "User", with: @peoplehaveweakness.user_id
    fill_in "Weakness", with: @peoplehaveweakness.weakness_id
    click_on "Create Peoplehaveweakness"

    assert_text "Peoplehaveweakness was successfully created"
    click_on "Back"
  end

  test "updating a Peoplehaveweakness" do
    visit peoplehaveweaknesses_url
    click_on "Edit", match: :first

    fill_in "Linkspouseperson", with: @peoplehaveweakness.linkspouseperson_id
    fill_in "Person", with: @peoplehaveweakness.person_id
    fill_in "User", with: @peoplehaveweakness.user_id
    fill_in "Weakness", with: @peoplehaveweakness.weakness_id
    click_on "Update Peoplehaveweakness"

    assert_text "Peoplehaveweakness was successfully updated"
    click_on "Back"
  end

  test "destroying a Peoplehaveweakness" do
    visit peoplehaveweaknesses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Peoplehaveweakness was successfully destroyed"
  end
end
