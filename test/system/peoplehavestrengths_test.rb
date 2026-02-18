require "application_system_test_case"

class PeoplehavestrengthsTest < ApplicationSystemTestCase
  setup do
    @peoplehavestrength = peoplehavestrengths(:one)
  end

  test "visiting the index" do
    visit peoplehavestrengths_url
    assert_selector "h1", text: "Peoplehavestrengths"
  end

  test "creating a Peoplehavestrength" do
    visit peoplehavestrengths_url
    click_on "New Peoplehavestrength"

    fill_in "Linkspouseperson", with: @peoplehavestrength.linkspouseperson_id
    fill_in "Person", with: @peoplehavestrength.person_id
    fill_in "Strength", with: @peoplehavestrength.strength_id
    fill_in "User", with: @peoplehavestrength.user_id
    click_on "Create Peoplehavestrength"

    assert_text "Peoplehavestrength was successfully created"
    click_on "Back"
  end

  test "updating a Peoplehavestrength" do
    visit peoplehavestrengths_url
    click_on "Edit", match: :first

    fill_in "Linkspouseperson", with: @peoplehavestrength.linkspouseperson_id
    fill_in "Person", with: @peoplehavestrength.person_id
    fill_in "Strength", with: @peoplehavestrength.strength_id
    fill_in "User", with: @peoplehavestrength.user_id
    click_on "Update Peoplehavestrength"

    assert_text "Peoplehavestrength was successfully updated"
    click_on "Back"
  end

  test "destroying a Peoplehavestrength" do
    visit peoplehavestrengths_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Peoplehavestrength was successfully destroyed"
  end
end
