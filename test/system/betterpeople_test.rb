require "application_system_test_case"

class BetterpeopleTest < ApplicationSystemTestCase
  setup do
    @betterperson = betterpeople(:one)
  end

  test "visiting the index" do
    visit betterpeople_url
    assert_selector "h1", text: "Betterpeople"
  end

  test "creating a Betterperson" do
    visit betterpeople_url
    click_on "New Betterperson"

    fill_in "Attitude", with: @betterperson.attitude_id
    fill_in "Twoperson", with: @betterperson.twoperson_id
    fill_in "User", with: @betterperson.user_id
    click_on "Create Betterperson"

    assert_text "Betterperson was successfully created"
    click_on "Back"
  end

  test "updating a Betterperson" do
    visit betterpeople_url
    click_on "Edit", match: :first

    fill_in "Attitude", with: @betterperson.attitude_id
    fill_in "Twoperson", with: @betterperson.twoperson_id
    fill_in "User", with: @betterperson.user_id
    click_on "Update Betterperson"

    assert_text "Betterperson was successfully updated"
    click_on "Back"
  end

  test "destroying a Betterperson" do
    visit betterpeople_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Betterperson was successfully destroyed"
  end
end
